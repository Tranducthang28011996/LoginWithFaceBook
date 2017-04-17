class Income < ApplicationRecord
	belongs_to :user
	has_many :income_categories
	has_many :categories, through: :income_categories
end
