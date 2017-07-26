class AddSoftDeleteToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :deleted, :boolean
  end
end
