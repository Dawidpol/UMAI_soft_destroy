class AddSoftDeleteToAuthors < ActiveRecord::Migration[5.0]
  def change
    add_column :authors, :deleted, :boolean, :default => false
  end
end
