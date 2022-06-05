class Product < ApplicationRecord
  belongs_to :butchery
  has_many :orders
  has_one_attached :photo
end
