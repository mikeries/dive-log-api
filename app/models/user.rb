class User < ApplicationRecord
  has_many :dives
  has_many :locations
end


