class Category < ApplicationRecord
belongs_to :user
	has_many :income_categories 
	has_many :incomes ,through: :income_categories

	has_many :cost_categories
	has_many :costs, through: :cost_categories
end
