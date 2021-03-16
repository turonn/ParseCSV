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
  has_many :driving_records, class_name: 'DriveingRecord', foregin_key: :driver_id
end
