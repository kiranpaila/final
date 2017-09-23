class CreateFunds < ActiveRecord::Migration[5.1]
  def change
    create_table :funds do |t|
      t.string :sponsor
      t.integer :amount
      t.string :status
      t.string :event

      t.timestamps
    end
  end
end
