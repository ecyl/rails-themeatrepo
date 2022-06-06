class Butchery < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :products

  # geocoding
  geocoded_by :address
  after_validation :geocode
end
