class CreateButcheries < ActiveRecord::Migration[6.1]
  def change
    create_table :butcheries do |t|
      t.string :name
      t.text :address
      t.string :phone_number
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
