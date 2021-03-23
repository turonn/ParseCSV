# == Schema Information
#
# Table name: drivers
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Driver < ApplicationRecord
  validates :name, presence: { message: "- Driver must have a name." }
  validates :name, uniqueness: { message: "- Driver already exists."}
  
  has_many :driving_records, class_name: 'DrivingRecord', foreign_key: :driver_id

end
