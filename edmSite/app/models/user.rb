class User < ActiveRecord::Base
  	attr_accessible :first_name, :last_name, :login, :password, :password_confirmation
	validates :first_name, :presence => true
	validates :last_name, :presence => true
	validates :login, :presence => true
	validates :login, :uniqueness => true
	validates :password, :presence => true
	validates :password, :confirmation => true

	def password_valid?(test)
		self.password_digest == Digest::SHA1.hexdigest(test + self.salt)
	end

	def password
		@password
	end


	def password=(real)
		@password = real
		self.salt = rand.to_s
		self.password_digest = Digest::SHA1.hexdigest(real + self.salt)
	end
end
