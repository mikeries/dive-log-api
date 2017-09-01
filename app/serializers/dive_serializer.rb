class DiveSerializer < ActiveModel::Serializer
  attributes :id, :location_id, :date, :time,
             :duration, :ballast, :max_depth,
             :starting_pressure, :final_pressure, :comments

end
