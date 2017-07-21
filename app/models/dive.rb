class Dive < ApplicationRecord
  belongs_to :user
  belongs_to :location
  validates_presence_of :date, :time, :duration, :max_depth, :starting_pressure,
                        :final_pressure
  validates :duration, :ballast, :max_depth, :starting_pressure, :final_pressure,
            :numericality => true
end