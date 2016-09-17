require 'rails_helper'
RSpec.describe User, type: :model do
  context 'associations' do
    it { should have_many(:orders) }
  end
  context 'validations' do
    it { is_expected.to validate_presence_of(:username) }
  end
  context 'uniqueness' do
    it { should validate_uniqueness_of(:username) }
  end
end
