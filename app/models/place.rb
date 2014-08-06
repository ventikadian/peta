class Place < ActiveRecord::Base
	validates :name, presence: true
	validates :name, uniqueness: true
	validates :longitute, presence: true
	validates :longitute, uniqueness: true
	validates :latitude, presence: true
	validates :latitude, uniqueness: true
end
