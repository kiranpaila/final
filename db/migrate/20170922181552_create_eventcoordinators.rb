class CreateEventcoordinators < ActiveRecord::Migration[5.1]
  def change
    create_table :eventcoordinators do |t|
      t.string :Event
      t.string :Name
      t.string :Name
      t.string :Contact_no
      t.string :Email

      t.timestamps
    end
  end
end
