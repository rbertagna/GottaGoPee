class CreateBathrooms < ActiveRecord::Migration

  def up
    create_table :bathrooms do |t|
      t.string :address
      t.string :open_year_round
      t.string :handicap
      t.string :borough
      t.float :rating
    end
  end

  def down
    drop_table :bathrooms
  end
  
end
