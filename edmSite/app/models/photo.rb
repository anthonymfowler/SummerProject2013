class Photo < ActiveRecord::Base
	attr_accessible :user_id, :date_time, :file_name, :festival_id
	belongs_to :user
	belongs_to :festival


	def writePhotoData (uploaded_io)
		File.open(Rails.root.join('public', 'images', uploaded_io.original_filename), 'wb') do |file|
    		file.write(uploaded_io.read)
    	end
	end


end
