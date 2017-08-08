class Location < ApplicationRecord
  belongs_to :user
  has_many :dives, :dependent => :destroy
  validates_presence_of :name, :country
end
