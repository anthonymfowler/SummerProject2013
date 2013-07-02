class Photo < ActiveRecord::Base
	attr_accessible :user_id, :date_time, :file_name
	belongs_to :user
	belongs_to :festival
end
