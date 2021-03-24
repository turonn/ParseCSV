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
  validates :start_time, presence: { message: "- Trip must have a start time." }
  validates :end_time, presence: { message: "- Trip must have an end time." }
  validates :start_time, :end_time, format: { with: /\A[0-9]{1,2}:[0-9]{2}\z/,
    message: "invalid time value %{value}" }
  validates :miles_driven, presence: { message: "- Trip must have miles driven." }
  validates :miles_driven, format: { without: /[^0-9.]/, message: "invalid distance value %{value}"}
  #validates :calculate_speed
  
  belongs_to :driver, class_name: 'Driver', foreign_key: :driver_id

  before_create :calculate_time
  #before_create :calculate_speed

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

  def calculate_speed
    time = self.total_time.split(':')
    distance = self.miles_driven.to_f

    time[1] = time[1].to_f / 60.0
    timeNum = time[0].to_i + time[1]

    #self.trip_speed = (distance / timeNum)
    
  end

end
