require 'rails_helper'

RSpec.describe "Drivers", type: :request do

  describe "GET /index" do
    it 'renders a successful response' do
      get drivers_path
      expect(response).to be_successful
    end
    it 'returns all drivers' do
      Driver.create(name: 'Seri')
      Driver.create(name: 'Jacqui')
      Driver.create(name: 'Roman')

      get drivers_path

      expect(@controller.instance_variable_get(:@drivers).length).to eq(3)
    end
    it 'sorts the drivers in order of total miles driven' do
      seri = Driver.create(name: 'Seri')
      jacqui = Driver.create(name: 'Jacqui')
      roman = Driver.create(name: 'Roman')
      
      DrivingRecord.create(driver: Driver.find_by(name: 'Seri'), start_time: '1:15', end_time: '2:15', miles_driven: '45')
      DrivingRecord.create(driver: Driver.find_by(name: 'Jacqui'), start_time: '1:15', end_time: '2:15', miles_driven: '60')
      DrivingRecord.create(driver: Driver.find_by(name: 'Roman'), start_time: '1:15', end_time: '2:15', miles_driven: '55')

      get drivers_path

      expect(@controller.instance_variable_get(:@drivers)).to eq([
        jacqui,
        roman,
        seri
      ])

      expect(@controller.instance_variable_get(:@drivers)).to_not eq([
        roman,
        seri,
        jacqui
        ])
    end

    it 'ignores trips of speeds over 100mph when sorting drivers' do
      seri = Driver.create(name: 'Seri')
      jacqui = Driver.create(name: 'Jacqui')
      roman = Driver.create(name: 'Roman')
      
      DrivingRecord.create(driver: Driver.find_by(name: 'Seri'), start_time: '1:15', end_time: '2:15', miles_driven: '48')
      DrivingRecord.create(driver: Driver.find_by(name: 'Roman'), start_time: '1:15', end_time: '2:15', miles_driven: '110')
      DrivingRecord.create(driver: Driver.find_by(name: 'Jacqui'), start_time: '1:15', end_time: '2:15', miles_driven: '50')
      DrivingRecord.create(driver: Driver.find_by(name: 'Roman'), start_time: '1:15', end_time: '2:15', miles_driven: '49')

      get drivers_path

      expect(@controller.instance_variable_get(:@drivers)).to eq([
        jacqui,
        roman,
        seri
      ])
    end

    it 'ignores trips of speeds under 5mph when sorting drivers' do
      seri = Driver.create(name: 'Seri')
      jacqui = Driver.create(name: 'Jacqui')
      roman = Driver.create(name: 'Roman')
      
      DrivingRecord.create(driver: Driver.find_by(name: 'Seri'), start_time: '1:15', end_time: '2:15', miles_driven: '48')
      DrivingRecord.create(driver: Driver.find_by(name: 'Seri'), start_time: '1:15', end_time: '2:15', miles_driven: '3')
      DrivingRecord.create(driver: Driver.find_by(name: 'Jacqui'), start_time: '1:15', end_time: '2:15', miles_driven: '50')
      DrivingRecord.create(driver: Driver.find_by(name: 'Roman'), start_time: '1:15', end_time: '2:15', miles_driven: '49')

      get drivers_path

      expect(@controller.instance_variable_get(:@drivers)).to eq([
        jacqui,
        roman,
        seri
      ])
    end
  end
end
