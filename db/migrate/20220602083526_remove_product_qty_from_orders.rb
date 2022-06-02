class RemoveProductQtyFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :product_qty_id
  end
end
