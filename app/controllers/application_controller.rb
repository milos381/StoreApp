class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :current_user
    helper_method :current_user
    helper_method :logged_in?
  
    private
  
    def logged_in?
      redirect_to root_path, alert: "Not authorized" unless !current_user.nil?  
    end
  
    def current_user
      @current_user = User.find_by(id: session[:user_id]) 
    end
end
