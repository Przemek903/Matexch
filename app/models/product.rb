class Product < ActiveRecord::Base
	belongs_to :classification
	has_many :exchanges

	has_many :users, through: :transactions
	has_many :transactions

	validates :name, :classification_id, :currentExchange, presence: true
end
