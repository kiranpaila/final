class CreateRegistrations < ActiveRecord::Migration[5.1]
  def change
    create_table :registrations do |t|
      t.string :Name
      t.string :Event
      t.string :Contact_no
      t.string :Email
      t.string :College

      t.timestamps
    end
  end
end
