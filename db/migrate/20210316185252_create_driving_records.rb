class CreateDrivingRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :driving_records do |t|
      t.belongs_to :driver
      t.string :start_time
      t.string :end_time
      t.string :miles_driven

      t.timestamps
    end
  end
end
