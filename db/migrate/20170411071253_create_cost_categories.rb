class CreateCostCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :cost_categories do |t|
      t.integer :cost_id
      t.integer :category_id

      t.timestamps
    end
  end
end
