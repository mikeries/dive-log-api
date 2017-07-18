
class DivesController < ApplicationController

  def index
    render json: User.first.dives
  end

  def update
    dive = User.first.dives.find(params[:id])
    dive.update(dive_params)
    render json: {}
  end

  private

  def dive_params
    params.require(:dive).permit(
      :id, 
      :datetime, 
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