class Changecolumn < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :isadmin, :integer, :default => 0
  end
end
