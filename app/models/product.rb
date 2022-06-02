class Product < ApplicationRecord
  belongs_to :butchery
  has_many :orders
end
