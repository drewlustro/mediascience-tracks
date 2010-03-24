# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  filter_parameter_logging :password
  before_filter :get_current_user
  
  
  protected
    def get_current_user
      @current_user ||= session[:current_user_id] && User.find(session[:current_user_id])
      @logged_in = @current_user ? true : false
    end  
    
    def require_login
      unless @logged_in
        flash[:error] = "You must login to perform that action."
        redirect_to login_url
      end
    end
      
end
