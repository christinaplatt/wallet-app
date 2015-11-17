class Card < ActiveRecord::Base
	has_many :users, through: :user_card
	has_many :user_card
	belongs_to :users
end
