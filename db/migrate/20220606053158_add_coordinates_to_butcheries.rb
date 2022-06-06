class AddCoordinatesToButcheries < ActiveRecord::Migration[6.1]
  def change
    add_column :butcheries, :latitude, :float
    add_column :butcheries, :longitude, :float
  end
end
