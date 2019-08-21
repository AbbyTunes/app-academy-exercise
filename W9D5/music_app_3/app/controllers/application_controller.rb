class ApplicationController < ActionController::Base

    def current_user
        # render plain: "ApplicationController: current_user"

        return nil unless session[:session_token]

    end

    def logged_in?
        # render plain: "ApplicationController: logged_in?"

    end

    def log_in!(user)
        # render plain: "ApplicationController: log_in_user!"

        token = user.reset_session_token
        session[:session_token] = token
    end
end
