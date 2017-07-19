class LocationsController < ApplicationController
  :authenticate

  def index
    render json: User.first.locations.order(:name)
  end

end