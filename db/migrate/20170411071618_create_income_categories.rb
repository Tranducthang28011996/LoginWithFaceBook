class CreateIncomeCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :income_categories do |t|
      t.integer :income_id
      t.integer :categoty_id

      t.timestamps
    end
  end
end
