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

  def facebook_user
    token = session_params[:token]
    return unless facebook_token_valid?(token)

    uid = session_params[:uid]
    response = Faraday.get("https://graph.facebook.com/#{uid}?access_token=#{token}&fields=email, name ")
    auth = JSON.parse(response.body)

    user = User.find_or_create_by(uid: uid) do |u|
      u.name = auth['name']
      u.email = auth['email']
    end

    if user
      jwt = Auth.encode_uid(uid)
      render json: { jwt: jwt, user: user }
    end
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

  def session_params
     params.permit(
      :token,
      :uid
    )
  end

  def auth
    request.env['omniauth.auth']
  end
end