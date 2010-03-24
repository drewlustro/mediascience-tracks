class SessionsController < ApplicationController
  
  skip_before_filter :get_current_user, :only => [:destory]
  # login form
  def index
    render :action => "new"
  end
  
  def new   
  end

  def create
    @username = params[:username]
    @password = params[:password]
    @current_user = User.authorize(@username, @password)
    if @current_user
      flash[:notice] = "Welcome back, #{@current_user.username}!"
      session[:current_user_id] = @current_user.id
      redirect_to user_url @current_user
    else
      flash.now[:error] = "Username & password combination was invalid."
      render :action => "new"
    end    
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_url
  end

  

end
