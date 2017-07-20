class ApplicationController < ActionController::API  
  before_action :authenticate 

  def logged_in?
    !!current_user
  end

  def current_user
    return @current_user if @current_user
    if auth_present?
      uid = Auth.decode_uid(read_token_from_request)
      user = User.find_by({uid: uid})
      return user if user
    end
  end

  def authenticate
    render json: {error: "unauthorized"}, status: 401 unless logged_in?
  end

  private

  def read_token_from_request
    token = request.env["HTTP_AUTHORIZATION"].scan(/Bearer: (.*)$/).flatten.last
  end

  def auth_present?
    !!request.env.fetch("HTTP_AUTHORIZATION", "").scan(/Bearer/).flatten.first
  end
end
