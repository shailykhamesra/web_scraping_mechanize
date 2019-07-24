class CreateRestaurants < ActiveRecord::Migration[4.2]
  def change
  	create_table :restaurants do |t|
      t.string :name
      t.string :cost
      t.timestamps
    end
  end
end
