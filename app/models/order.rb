class Order < ApplicationRecord
  # belongs_to :product_qty
  belongs_to :product
  belongs_to :user
end
