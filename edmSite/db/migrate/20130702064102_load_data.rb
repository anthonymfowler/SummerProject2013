class LoadData < ActiveRecord::Migration
  def up
  	edc = Festival.new(:festival_name => "EDC Las Vegas", :start_date => "2013-06-18", :duration => "3", :location => "Las Vegas Speedway")
  	edc.save(:validate => false)

  	#create photos
  	photo1 = Photo.new(:date_time => "2013-08-30 10:44:23",
        :file_name => "edc.jpg")
    photo1.festival = edc
    photo1.save(:validate => false)
  end

  def down
  	User.delete_all
  end
end
