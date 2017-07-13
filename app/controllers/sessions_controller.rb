class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
    end
 
    session[:user_id] = @user.id
 
    redirect_to 'http://localhost:3001?token="yay"'
  end

  def authenticate
    redirect_to '/auth/facebook' if params[:type]=='facebook'
    redirect_to '/auth/github' if params[:type]=='github'
  end
 
  private
 
  def auth
    request.env['omniauth.auth']
  end
end