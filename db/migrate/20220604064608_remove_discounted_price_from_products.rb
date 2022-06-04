class RemoveDiscountedPriceFromProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :discounted_price, :float
  end
end
