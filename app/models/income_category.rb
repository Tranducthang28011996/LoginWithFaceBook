class IncomeCategory < ApplicationRecord
	belongs_to :income
	belongs_to :category
	# validates :category_id, allow_nil: true , presence: true
end