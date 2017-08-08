class LocationsController < ApplicationController
  :authenticate

  def index
    render json: current_user.locations.order(:name)
  end

  def create
    location = current_user.locations.build(location_params)

    if location.save
      render json: location
    else 
      render json: {errors: location.errors}, status: 422
    end

  end

  def update
    location = current_user.locations.find(params[:id])

    if location.update(location_params)
      render json: {}
    else
      render json: {errors: location.errors}, status: 422
    end
  end

  def destroy
    Location.destroy(params[:id])
    render json: {}
  end

  private

  def location_params
    params.require(:location).permit(
      :name,
      :city,
      :country,
      :category,
      :description
    )
  end

end