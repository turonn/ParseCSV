require 'rails_helper'

RSpec.describe DrivingRecord, type: :model do
  subject { described_class.new(driver: Driver.create(name: 'testDave'), start_time: '1:15', end_time: '2:20', miles_driven: '45') }

  describe 'validations' do
    describe 'driver' do
      it 'must exist' do
        expect(subject).to be_valid
        subject.driver = nil
        expect(subject).to_not be_valid
      end
    end
    
    describe 'start_time' do
      it 'must exist' do
        expect(subject).to be_valid
        subject.start_time = nil
        expect(subject).to_not be_valid
      end
      it 'cannot have letters symbols or whitespace' do
        subject.start_time = '1:04a'
        expect(subject).to_not be_valid
        subject.start_time = '1:04 '
        expect(subject).to_not be_valid
        subject.start_time = '1:04.'
        expect(subject).to_not be_valid
      end
      it 'must only have 1 or 2 hour digits' do
        expect(subject).to be_valid
        subject.start_time = '10:05'
        expect(subject).to be_valid
        subject.start_time = '001:04 '
        expect(subject).to_not be_valid
        subject.start_time = ':04 '
        expect(subject).to_not be_valid
      end
      it 'must have exactly 2 minute digits' do
        subject.start_time = '1:4'
        expect(subject).to_not be_valid
        subject.start_time = '1:'
        expect(subject).to_not be_valid
        subject.start_time = '1:040'
        expect(subject).to_not be_valid
      end
    end

    describe 'end_time' do
      it 'must exist' do
        expect(subject).to be_valid
        subject.start_time = nil
        expect(subject).to_not be_valid
      end
      it 'cannot have letters symbols or whitespace' do
        subject.start_time = '1:04a'
        expect(subject).to_not be_valid
        subject.start_time = '1:04 '
        expect(subject).to_not be_valid
        subject.start_time = '1:04.'
        expect(subject).to_not be_valid
      end
      it 'must only have 1 or 2 hour digits' do
        expect(subject).to be_valid
        subject.start_time = '10:05'
        expect(subject).to be_valid
        subject.start_time = '001:04 '
        expect(subject).to_not be_valid
        subject.start_time = ':04 '
        expect(subject).to_not be_valid
      end
      it 'must have exactly 2 minute digits' do
        subject.start_time = '1:4'
        expect(subject).to_not be_valid
        subject.start_time = '1:'
        expect(subject).to_not be_valid
        subject.start_time = '1:040'
        expect(subject).to_not be_valid
      end
    end
  end

  describe '#calculate_time' do
    it 'calculates how long the drive was in hh:mm format' do  
      expect(subject.calculate_time).to eq '1:05'
      subject.start_time = "1:00"
      subject.end_time = "11:10"
      expect(subject.calculate_time).to eq '10:10'
    end
    it 'handles converting -minutes to fewer hours' do
      subject.start_time = "13:59"
      subject.end_time = "14:19"
      expect(subject.calculate_time).to eq '0:20'
    end
  end

  describe '#calculate_speed' do
    it 'calculates speed correctly' do
      subject.total_time = "1:00"
      subject.miles_driven = "45"
      expect(subject.calculate_speed).to eq "45.0"
    end
    it 'can handle rounding' do
      subject.total_time = ":59"
      subject.miles_driven = "45"
      expect(subject.calculate_speed).to eq "45.8"
    end
  end

end
