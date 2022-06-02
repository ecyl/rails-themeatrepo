class CreateProductQties < ActiveRecord::Migration[6.1]
  def change
    create_table :product_qties do |t|
      t.integer :quantity
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
