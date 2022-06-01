class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.string :country
      t.date :expiration_date
      t.references :butchery, null: false, foreign_key: true

      t.timestamps
    end
  end
end
