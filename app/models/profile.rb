class Profile < ActiveRecord::Base	
	belongs_to :user

	validates :name, :surname, :city, :homeNumber, :streetNumber, presence: true
	validates :homeNumber, :streetNumber, numericality: { only_integer: true }
end
