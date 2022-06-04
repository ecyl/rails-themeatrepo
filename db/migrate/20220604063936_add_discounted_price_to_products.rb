class AddDiscountedPriceToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :discounted_price, :float
  end
end
