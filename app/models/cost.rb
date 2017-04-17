class Cost < ApplicationRecord
belongs_to :user
	has_many :cost_categories
	has_many :categories ,through: :cost_categories
end