
class DivesController < ApplicationController

  def index
    render json: current_user.dives.order(:date, :time)
  end

  def create
    dive = current_user.dives.build(dive_params)
    if dive.save
      render json: dive
    else
      render json: { errors: dive.errors }, status: 422
    end
  end

  def update
    dive = current_user.dives.find(params[:id])

    if dive.update(dive_params)
      render json: {}
    else
      render json: { errors: dive.errors }, status: 422
    end
  end

  def destroy
    current_user.dives.delete(params[:id])
    render json: {}
  end

  private

  def dive_params
    params.require(:dive).permit(
      :date,
      :time,
      :location_id,
      :duration,
      :ballast,
      :max_depth,
      :starting_pressure,
      :final_pressure,
      :comments
    )
  end
end
