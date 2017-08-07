class LocationsController < ApplicationController
  :authenticate

  def index
    render json: User.first.locations.order(:name)
  end

    def create
    location = User.first.locations.build(location_params)
    if location.save
      render json: location
    else 
      render json: {errors: location.errors}, status: 422
    end

  end

  def update
    location = User.first.locations.find(params[:id])

    if location.update(location_params)
      render json: {}
    else
      render json: {errors: location.errors}, status: 422
    end
  end

  def destroy
    User.first.locations.delete(params[:id])
    render json: {}
  end

  private

  def location_params
    params.require(:location).permit(
      :name,
      :city,
      :country,
      :type,
      :description
    )
  end

end