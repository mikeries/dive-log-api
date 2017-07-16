class LocationsController < ApplicationController
  skip_before_action :authenticate

  def index
    render json: User.first.locations
  end

end