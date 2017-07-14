require 'Auth'

class SessionsController < ApplicationController
  skip_before_action :authenticate

  def create
    user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
    end
 
    if user
      jwt = Auth.create_token({user: user.uid})
      redirect_to 'http://localhost:3001?token=' + jwt
    end

    ## TODO: exit silently
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