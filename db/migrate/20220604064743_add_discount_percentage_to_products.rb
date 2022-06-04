class AddDiscountPercentageToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :discount_percentage, :integer
  end
end
