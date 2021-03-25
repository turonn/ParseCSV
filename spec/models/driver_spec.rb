require 'rails_helper'

RSpec.describe Driver, type: :model do
  subject { described_class.new(name: "danTest") }

  describe 'validations' do
    describe 'name' do
      it 'must have a unique name' do
        described_class.create(name: 'John')
        subject.name = 'John'
        expect(subject).to_not be_valid
      end
      it 'cannot be empty' do
        subject.name = ''
        expect(subject).to_not be_valid
      end
    end
  end
end