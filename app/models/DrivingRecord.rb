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

  before_create :calculate_time

  def calculate_time
    startArray = self.start_time.split(':')
    endArray = self.end_time.split(':')

    totalMin = endArray[1].to_i - startArray[1].to_i
    totalHr = endArray[0].to_i - startArray[0].to_i

    if totalMin < 0
      totalHr -= 1
      totalMin += 60
    end
    self.total_time = "#{totalHr}:#{totalMin}"
  end

end
