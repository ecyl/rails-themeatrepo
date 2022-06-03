class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      # t.references :product_qty, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :order_status, default: false # false = unfulfilled, true = fulfilled

      t.timestamps
    end
  end
end
