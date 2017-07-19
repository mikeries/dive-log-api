class DiveSerializer < ActiveModel::Serializer
  attributes :id, :datetime, :location_id, :date, :time,
             :duration, :ballast, :max_depth,
             :starting_pressure, :final_pressure, :comments
  belongs_to :location
end
