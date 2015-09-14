class AddColumnTitle < ActiveRecord::Migration
  
  def up
    add_column :bathrooms, :title, :string
  end
  
  def down
    remove_column :bathrooms, :title
  end
  
end
