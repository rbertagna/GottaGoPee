class AddColumnToBathrooms < ActiveRecord::Migration
  
  def up
    add_column :bathrooms, :latitude, :float
    add_column :bathrooms, :longitude, :float
  end
  
  def down
    remove_column :bathrooms, :latitude
    remove_column :bathrooms, :longitude
  end
  
end
