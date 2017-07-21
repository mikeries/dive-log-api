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
      jwt = Auth.encode_uid(user.uid)
      redirect_to(ENV['DIVE_LOG_CLIENT_URL'] + "?token=#{jwt}")
    end
    ## TODO: exit silently
  end

  def authenticate
    redirect_to '/auth/facebook' if params[:type] == 'facebook'
    redirect_to '/auth/github' if params[:type] == 'github'
  end

  def get_current_user
    render json: current_user
    ##render json: { errors: {name: 'Error message One', email: 'another error'} }, status: 201
  end
 
  private
 
  def auth
    request.env['omniauth.auth']
  end
end