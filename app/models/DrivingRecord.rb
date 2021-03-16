# == Schema Information
#
# Table name: driving_records
#
#  id             :bigint           not null, primary key
#  driver_id      :bigint
#  start_time     :datetime
#  end_time       :datetime
#  start_location :string
#  end_location   :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class DrivingRecord < ApplicationRecord
  belongs_to :driver, class_name: 'Driver', foreign_key: :driver_id
end
