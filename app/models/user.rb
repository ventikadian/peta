class User < ActiveRecord::Base
	has_secure_password

	validates :email, presence: true, uniqueness: true
	#namabhin validasi untuk keberadaan password dan password konfirmasi
	
end
