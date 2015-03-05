class CreatePastries < ActiveRecord::Migration
  def change
  	# create db with a table pastry with 3 attributes
    create_table :pastries do |t|
    	t.string :name
    	t.integer :price_in_pence
    	t.text :description

      t.timestamps null: false
    end
  end
end
