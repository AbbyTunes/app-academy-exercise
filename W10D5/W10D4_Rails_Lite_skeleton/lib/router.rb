require 'byebug'

class Route
  attr_reader :pattern, :http_method, :controller_class, :action_name

  def initialize(pattern, http_method, controller_class, action_name)
    @pattern = pattern
    @http_method = http_method
    @controller_class = controller_class
    @action_name = action_name
  end

  # checks if pattern matches path and method matches request method
  def matches?(req)
    http_method == req.request_method.downcase.to_sym && (pattern =~ req.path)
  end

  # use pattern to pull out route params (save for later?)
  # instantiate controller and call controller action
  def run(req, res)
    # debugger
    if self.matches?(req)

      match_data = @pattern.match(req.path)
      keys = match_data.names 
      values = match_data.captures
      route_params = Hash[keys.product(values)]
      debugger
      # route_params = Hash.new {"id" => 1,  }
      
      controller_instance = controller_class.new(req, res, route_params)
      controller_instance.invoke_action(action_name)
    end
  end
end

# On every request router.run should be called with the 
# Rack::Response and Rack::Request as parameters. 
# The #run method will figure out what URL was requested,
# match it to the path regex of one Route object, and finally 
# ask the Route to instantiate the appropriate controller, and call the appropriate method.

class Router
  attr_reader :routes

  def initialize
    @routes = []
  end

  # simply adds a new route to the list of routes
  def add_route(pattern, method, controller_class, action_name)
    @routes << Route.new(pattern, method, controller_class, action_name)
  end

  # evaluate the proc in the context of the instance
  # for syntactic sugar :)
  def draw(&proc)
    instance_eval(&proc) # proc.call
  end

  # make each of these methods that
  # when called add route
  [:get, :post, :put, :delete].each do |http_method|
    define_method(http_method) do |pattern, controller_class, action_name|
      add_route(pattern, http_method, controller_class, action_name)
    end
  end

  # get( Regexp.new("^/cats$"), :get, Cats2Controller, :index )
  # routes = Router.new
  # routes.draw do
  #   get(Regexp.new("^/cats$"), Cats2Controller, :index)
  #   get Regexp.new("^/cats/(\\d+)/statuses$"), StatusesController, :index get(Regexp.new("^/cats/(\\d+)/statuses$"), StatusesController, :index)
  # end

  # should return the route that matches this request
  def match(req)
    @routes.each do |route|
      return route if route.matches?(req)
    end

    nil
  end

  # either throw 404 or call run on a matched route
  def run(req, res)
    first_matching_route = match(req)

    if first_matching_route
      first_matching_route.run(req, res)
    else 
      res.status = 404
    end
  end
end
