class DiveSerializer < ActiveModel::Serializer
  attributes :id, :datetime
  belongs_to :location
end