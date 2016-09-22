require 'rails_helper'
RSpec.describe Order, type: :model do
  context 'associations' do
    it { should have_many(:order_items) }
    it { should have_many(:items).through(:order_items) }
    it { should belong_to(:user) }
  end

  it 'should return its contained items' do
    order = create(:order)
    item_1 = create(:item)
    item_2 = create(:item)

    OrderItem.create(order: order, item: item_1)
    OrderItem.create(order: order, item: item_2)

    expect(order.contained_items).to eq(item_1 => 1, item_2 => 1)
  end

  it 'should return a breakdown of orders by status' do
    create(:order, status: 'completed')
    create(:order, status: 'paid')

    expect(Order.breakdown).to eq('completed' => 1, 'paid' => 1)
  end

  it 'can confirm an order belongs to a user' do
    user = create(:user_with_orders)
    order = user.orders.first

    expect(user.order?(order.id)).to be true
  end

  it 'can confirm an order does not belong to a user' do
    user = create(:user)
    order = create(:order)

    expect(user.order?(order.id)).to be false
  end
end
