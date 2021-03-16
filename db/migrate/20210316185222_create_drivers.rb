class CreateDrivers < ActiveRecord::Migration[6.0]
  def change
    create_table :drivers do |t|
      t.string :name
      # t.string :email
      # t.string :address1
      # t.string :address2
      # t.string :city
      # t.string :state
      # t.string :zip
      # t.string :phone

      t.timestamps
    end
  end
end
