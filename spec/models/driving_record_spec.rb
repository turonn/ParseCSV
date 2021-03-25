require 'rails_helper'

RSpec.describe DrivingRecord, type: :model do
  it 'calculates how long the drive was in hh:mm format' do
    record = DrivingRecord.create(start_time: '1:15', end_time: '2:20')

    expect(record.calculate_time).to eq '1:05'
  end
end
