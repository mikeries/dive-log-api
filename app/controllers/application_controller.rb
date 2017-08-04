class ApplicationController < ActionController::API  
  before_action :authenticate 

  def logged_in?
    !!current_user
  end

  def current_user
    return @current_user if @current_user
    if auth_present?
      uid = Auth.decode_uid(read_token_from_request)
      @current_user = User.find_by(uid: uid)
      return @current_user if @current_user
    end
  end

  def facebook_token_valid?(token)
    response = Faraday.get("https://graph.facebook.com/app?access_token=#{token}")
    data = JSON.parse(response.body)

    return true if data['id'] == ENV['FACEBOOK_CLIENT_APP_ID']
    false
  end

  def authenticate
    render json: { error: 'unauthorized' }, status: 401 unless logged_in?
  end

  private

  def read_token_from_request
    request.env['HTTP_AUTHORIZATION'].scan(/Bearer: (.*)$/).flatten.last
  end

  def auth_present?
    !!request.env.fetch('HTTP_AUTHORIZATION', '').scan(/Bearer/).flatten.first
  end
end
