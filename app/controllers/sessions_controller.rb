require 'Auth'
require 'auth_token'

class SessionsController < ApplicationController
  skip_before_action :authenticate

  def create
    user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
    end

    if user
      jwt = Auth.encode_id(user.id)
      redirect_to(ENV['DIVE_LOG_CLIENT_URL'] + "?token=#{jwt}")
    end
  end

  def login_guest
    user = User.find(1)
    jwt = Auth.encode_id(user.id)

    render json: { jwt: jwt, user: user }
  end

  def authenticate_facebook_user

    tokenData = AuthToken.new(token_params)
    token = tokenData.token
    return unless facebook_token_valid?(token)

    uid = tokenData.uid
    response = Faraday.get("https://graph.facebook.com/#{uid}?access_token=#{token}&fields=email, name ")
    authorization = JSON.parse(response.body)

    user = User.find_or_create_by(uid: uid) do |u|
      u.name = authorization['name']
      u.email = authorization['email']
    end

    jwt = Auth.encode_id(id)
    render json: { jwt: jwt, user: user }

  end

  def get_current_user
     render json: current_user
  end
 
  private

  def token_params
    params.require(:data).permit(:token, :uid)
  end
 
  def auth
    request.env['omniauth.auth']
  end
end