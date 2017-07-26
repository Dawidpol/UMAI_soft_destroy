class AddDefaultFalse < ActiveRecord::Migration[5.0]
  def change
    change_column :books, :deleted, :boolean, :default => false
    change_column :authors, :deleted, :boolean, :default => false
  end
end
