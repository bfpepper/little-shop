require 'rails_helper'

RSpec.describe Cart, type: :model do
  it 'can add an item' do
    cart = Cart.new(nil)
    cart.add_item(2)

    expect(cart.contents).to eq('2' => 1)
  end

  it 'can find a total' do
    item = create(:item)
    cart = Cart.new(item.id => 1)

    expect(cart.total).to eq(item.price)
  end

  it 'can find contained items' do
    item = create(:item)
    cart = Cart.new(item.id => 1)

    expect(cart.contained_items).to eq(item => 1)
  end

  it 'can delete an item' do
    item = create(:item)
    cart = Cart.new(item.id.to_s => 1)

    cart.remove_item(item.id)
    expect(cart.contents).to be_empty
  end
end
