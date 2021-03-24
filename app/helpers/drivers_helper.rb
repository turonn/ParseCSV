module DriversHelper

  def total_miles(driver)
    total = 0.0
    driver.driving_records.each do |record|
      next if record.trip_speed.to_f < 5 || record.trip_speed.to_f > 100
      total += record.miles_driven.to_f
    end
    total
  end

  def total_time(driver)
    total = [0, 0]
    driver.driving_records.each do |record|
      next if record.trip_speed.to_f < 5 || record.trip_speed.to_f > 100
      record_time = record.total_time.split(':')
      total[0] += record_time[0].to_i
      total[1] += record_time[1].to_i
    end


    if total[1] > 60
      remainder = total[1] % 60
      total[1] -= remainder
      
      hours = total[1] / 60
      total[1] = remainder

      total[0] += hours
    end

    "#{total[0]}:#{total[1]}"
  end

  def average_speed(driver)
    distance = total_miles(driver).to_f
    unless distance == 0
      time = total_time(driver).split(':')

      time[1] = time[1].to_f / 60.0
      timeNum = time[0].to_i + time[1]

      (distance / timeNum).round()
    else
      ""
    end
  end

end