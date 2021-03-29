require 'rails_helper'

RSpec.describe Driver, type: :model do
  subject { described_class.new(name: "danTest") }

  describe 'validations' do
    describe 'name' do
      it 'must have a unique name' do
        subject.name = 'John'
        expect(subject).to be_valid

        described_class.create(name: 'John')
        expect(subject).to_not be_valid
        #it needs to be "subject" we test because subject has not yet been saved
        #the described_class we made just made was "created" so saved to the
        #database before the subject
      end
      it 'cannot be empty' do
        expect(subject).to be_valid
        subject.name = ''
        expect(subject).to_not be_valid
      end
    end
  end
end