class Festival < ActiveRecord::Base
	attr_accessible :festival_name, :start_date, :duration, :location, :photo_id
	has_many :artists
	has_one :photo
end
