class Order < ApplicationRecord
  belongs_to :product_qty
  belongs_to :user
end
