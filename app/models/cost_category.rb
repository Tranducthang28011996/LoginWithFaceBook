class CostCategory < ApplicationRecord
	belongs_to :cost
	belongs_to :category
end