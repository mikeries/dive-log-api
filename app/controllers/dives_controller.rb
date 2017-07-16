
class DivesController < ApplicationController
  skip_before_action :authenticate

  def index
    render json: User.first.dives
  end

end