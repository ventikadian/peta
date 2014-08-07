class User < ActiveRecord::Base
	#callback
	before_create :set_auth_token
	has_secure_password

	validates :email, presence: true, uniqueness: true
	#namabhin validasi untuk keberadaan password dan password konfirmasi
	def set_auth_token
		#looping dan generate number
		#break dari loop kalo ketemu number yang belum kepake
		self.auth_token = loop do
			token = SecureRandom.hex
			break token if !self.class.exists?(auth_token: token)
		end
	end
end
