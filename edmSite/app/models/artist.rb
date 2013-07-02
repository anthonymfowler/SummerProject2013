class Artist < ActiveRecord::Base
	attr_accessible :name, :genre
	belongs_to :festival
	belongs_to :user
end
