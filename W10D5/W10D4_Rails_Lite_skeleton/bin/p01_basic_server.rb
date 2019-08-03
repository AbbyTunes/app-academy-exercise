require 'rack'
# require 'byebug'

app_name = Proc.new do |env|
    req = Rack::Request.new(env)
    res = Rack::Response.new
    res['Content-Type'] = 'text/string/integer'
    # debugger
    res.write(req.path)
    res.finish
end

Rack::Server.start(
    app: app_name,
    Port: 3000
)
