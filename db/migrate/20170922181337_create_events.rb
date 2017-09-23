class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :Title
      t.text :Description
      t.string :Venue
      t.time :Time
      t.date :Date
      t.integer :Cost
      t.string :Department
      t.string :Type
      t.text :CordinatorDetails
      t.string :add_photo

      t.timestamps
    end
  end
end
