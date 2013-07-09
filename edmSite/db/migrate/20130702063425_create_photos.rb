class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
    	t.integer :user_id
    	t.integer :festival_id
    	t.string :festival_name
    	t.datetime :date_time
    	t.integer :location
    	t.string :file_name   
    end
  end
end
