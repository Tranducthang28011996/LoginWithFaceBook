class AddCategoryIdToIncomeCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :income_categories, :category_id, :integer
  end
end
