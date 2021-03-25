require "rails_helper"

RSpec.describe DriversHelper, :type => :helper do
  

  DrivingRecord.create(driver: Driver.find_by(name: 'Seri'), start_time: '1:15', end_time: '2:15', miles_driven: '48')
  DrivingRecord.create(driver: Driver.find_by(name: 'Roman'), start_time: '1:15', end_time: '2:15', miles_driven: '110')
  DrivingRecord.create(driver: Driver.find_by(name: 'Jacqui'), start_time: '1:15', end_time: '2:15', miles_driven: '50')
  DrivingRecord.create(driver: Driver.find_by(name: 'Roman'), start_time: '1:15', end_time: '2:15', miles_driven: '49')


  describe "#page_title" do
    it "returns the default title" do
      expect(helper.page_title).to eq("RSpec is your friend")
    end
  end
end
