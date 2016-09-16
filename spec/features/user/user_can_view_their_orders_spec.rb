require 'rails_helper'
RSpec.feature 'A user views their orders' do
  scenario 'they see all orders belonging to them' do
    user = create(:user_with_orders)
    order_1 = user.orders.first
    order_2 = user.orders.last

    visit login_path

    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_on 'Save Session'

    visit '/orders'

    expect(page).to have_content("Order #{order_1.id}: $#{order_1.price}")
    expect(page).to have_content("Order #{order_2.id}: $#{order_2.price}")
  end

  scenario "they don't see orders belonging to a different user" do
  end

  scenario 'they see the details of that order' do
    user = create(:user_with_orders)
    order_1 = user.orders.first
    item_1 = create(:item)
    item_2 = create(:item)
    OrderItem.create!(order_id: order_1.id, item_id: item_1.id)
    OrderItem.create(order_id: order_1.id, item_id: item_2.id)
    OrderItem.create(order_id: order_1.id, item_id: item_1.id)

    visit login_path

    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_on 'Save Session'
    visit '/orders'
    expect(page).to have_link('View order', href: order_path(order_1))

    click_link 'View order', href: order_path(order_1)
    
    expect(page).to have_content("2 #{item_1.title} #{item_1.price * 2}")
    expect(page).to have_content("1 #{item_2.title} #{item_2.price}")
    expect(page).to have_link(item_1.title, href: item_path(item_1))
    expect(page).to have_link(item_2.title, href: item_path(item_2))
    expect(page).to have_content(order_1.status)
    expect(page).to have_content(order_1.price)
    expect(page).to have_content(order_1.created_at)
  # expect(page).to_not have_content()
  end
end
