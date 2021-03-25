require "rails_helper"

RSpec.describe DriversHelper, :type => :helper do

  describe "#total_miles" do
    it "returns the number of miles driven" do
      subject = Driver.create(name: 'Seri')
      DrivingRecord.create(driver: Driver.find_by(name: 'Seri'), start_time: '1:15', end_time: '2:15', miles_driven: '20')
      DrivingRecord.create(driver: Driver.find_by(name: 'Seri'), start_time: '1:15', end_time: '2:15', miles_driven: '50')
      DrivingRecord.create(driver: Driver.find_by(name: 'Seri'), start_time: '1:15', end_time: '2:15', miles_driven: '30')

      expect(helper.total_miles(subject)).to eq("100.0")
    end

    it "ignores trips with speeds less than 5 or greater than 100" do
      subject = Driver.create(name: 'Seri')
      DrivingRecord.create(driver: Driver.find_by(name: 'Seri'), start_time: '1:15', end_time: '2:15', miles_driven: '40')
      DrivingRecord.create(driver: Driver.find_by(name: 'Seri'), start_time: '1:15', end_time: '2:15', miles_driven: '110')
      DrivingRecord.create(driver: Driver.find_by(name: 'Seri'), start_time: '1:15', end_time: '2:15', miles_driven: '3')
      DrivingRecord.create(driver: Driver.find_by(name: 'Seri'), start_time: '1:15', end_time: '2:15', miles_driven: '33.3')
      
      expect(helper.total_miles(subject)).to eq("73.3")
    end
  end

  describe "#total_time" do
    it "returns the time spent driving in /h+:mm/ format" do
      subject = Driver.create(name: 'Seri')
      DrivingRecord.create(driver: Driver.find_by(name: 'Seri'), start_time: '1:59', end_time: '2:15', miles_driven: '20')
      DrivingRecord.create(driver: Driver.find_by(name: 'Seri'), start_time: '20:50', end_time: '22:15', miles_driven: '50')
      DrivingRecord.create(driver: Driver.find_by(name: 'Seri'), start_time: '8:22', end_time: '8:50', miles_driven: '30')

      expect(helper.total_time(subject)).to eq("2:09")
    end
    it "ignores trips with speeds less than 5 or greater than 100" do
      subject = Driver.create(name: 'Seri')
      DrivingRecord.create(driver: Driver.find_by(name: 'Seri'), start_time: '1:59', end_time: '2:15', miles_driven: '20')
      DrivingRecord.create(driver: Driver.find_by(name: 'Seri'), start_time: '20:50', end_time: '22:15', miles_driven: '50')
      DrivingRecord.create(driver: Driver.find_by(name: 'Seri'), start_time: '8:22', end_time: '8:50', miles_driven: '30')
      DrivingRecord.create(driver: Driver.find_by(name: 'Seri'), start_time: '9:00', end_time: '10:00', miles_driven: '3')
      DrivingRecord.create(driver: Driver.find_by(name: 'Seri'), start_time: '10:00', end_time: '11:00', miles_driven: '200')

      expect(helper.total_time(subject)).to eq("2:09")
    end
  end

  describe "#average_speed" do
    it "returns an empty string if no trips qualify" do
      subject = Driver.create(name: 'Seri')
      DrivingRecord.create(driver: Driver.find_by(name: 'Seri'), start_time: '9:00', end_time: '10:00', miles_driven: '3')
      DrivingRecord.create(driver: Driver.find_by(name: 'Seri'), start_time: '10:00', end_time: '11:00', miles_driven: '200')

      expect(helper.average_speed(subject)).to eq("")
    end

    it "returns the correct average speed from all trips" do
      subject = Driver.create(name: 'Seri')
      DrivingRecord.create(driver: Driver.find_by(name: 'Seri'), start_time: '1:00', end_time: '2:00', miles_driven: '20')
      DrivingRecord.create(driver: Driver.find_by(name: 'Seri'), start_time: '1:00', end_time: '2:00', miles_driven: '30')
      DrivingRecord.create(driver: Driver.find_by(name: 'Seri'), start_time: '1:00', end_time: '2:00', miles_driven: '40')

      expect(helper.average_speed(subject)).to eq(30)
    end
    it "ignores trips with speeds less than 5 or greater than 100" do
      subject = Driver.create(name: 'Seri')
      DrivingRecord.create(driver: Driver.find_by(name: 'Seri'), start_time: '1:00', end_time: '2:00', miles_driven: '20')
      DrivingRecord.create(driver: Driver.find_by(name: 'Seri'), start_time: '1:00', end_time: '2:00', miles_driven: '30')
      DrivingRecord.create(driver: Driver.find_by(name: 'Seri'), start_time: '1:00', end_time: '2:00', miles_driven: '40')
      DrivingRecord.create(driver: Driver.find_by(name: 'Seri'), start_time: '9:00', end_time: '10:00', miles_driven: '3')
      DrivingRecord.create(driver: Driver.find_by(name: 'Seri'), start_time: '10:00', end_time: '11:00', miles_driven: '200')

      expect(helper.average_speed(subject)).to eq(30)
    end
  end
end
