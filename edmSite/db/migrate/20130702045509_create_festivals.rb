class CreateFestivals < ActiveRecord::Migration
  def change
    create_table :festivals do |t|
    	t.string :festival_name
    	t.date :start_date
    	t.integer :duration
    	t.string :location
    end
  end
end
