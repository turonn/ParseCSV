class CreateDrivingRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :driving_records do |t|
      t.belongs_to :driver
      t.datetime :start_time
      t.datetime :end_time
      t.string :start_location
      t.string :end_location

      t.timestamps
    end
  end
end
