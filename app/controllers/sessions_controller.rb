class SessionsController < ApplicationController
  def new
      
  end
  # def create
  #     @user = User.find_by(name: params[:user][:name])
  #     if @user && @user.authenticate(params[:user][:password])
  #       session[:user_id] = @user.id
  #       redirect_to @user
  #     else
  #       render :new
  #     end
  # end
  def create

    if auth
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.password = SecureRandom.hex
        u.money = 1000
      end
      
      session[:user_id] = @user.id
      render 'users/show'
    else
      @user = User.find_by(name: params[:user][:name])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to @user
      else
        
        render :new
      end
    end
  end
  def destroy
      session.delete("user_id")
      redirect_to '/'
  end
  private
  def auth
    request.env['omniauth.auth']
  end
end