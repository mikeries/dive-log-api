class Location < ApplicationRecord
  belongs_to :user
  has_many :dives
  validates_presence_of :name, :country
end
