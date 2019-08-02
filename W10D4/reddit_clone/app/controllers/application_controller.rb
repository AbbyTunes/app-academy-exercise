class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?, :ensure_log_in

    def current_user
        @current_user ||= User.find_by_session_token(session[:session_token])
        # ||=
    end

    def logged_in?
        !!current_user
    end

    def login(user)
        @current_user = user # @ ?
        session[:session_token] = user.reset_session_token
    end

    def logout
        session[:session_token] = nil
        current_user.reset_session_token
    end

    def ensure_log_in
        redirect_to new_session_url unless logged_in?
    end

    def require_signed_out!
        redirect_to user_url(current_user) if signed_in?
    end

end

