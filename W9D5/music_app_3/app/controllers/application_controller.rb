class ApplicationController < ActionController::Base

    def current_user
        render plain: "ApplicationController: current_user"
    end

    def logged_in?
        render plain: "ApplicationController: logged_in?"
    end

    def log_in_user!(user)
        render plain: "ApplicationController: log_in_user!"
    end
end
