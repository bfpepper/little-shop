require 'rails_helper'
RSpec.describe Item, type: :model do
  context 'associations' do
    it { should belong_to(:category) }
    it { should have_many(:order_items) }
    it { should have_many(:orders).through(:order_items) }
  end
end
