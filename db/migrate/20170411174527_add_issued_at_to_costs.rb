class AddIssuedAtToCosts < ActiveRecord::Migration[5.0]
  def change
    add_column :costs, :issued_at, :datetime
  end
end
