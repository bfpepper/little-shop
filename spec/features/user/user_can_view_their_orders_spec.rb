require 'rails_helper'
RSpec.feature 'A user views their orders' do
  scenario 'they see all orders belonging to them' do
    user = create(:user_with_orders)
    order_1 = user.orders.first
    order_2 = user.orders.last

    visit login_path

    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Login'

    visit '/orders'

    expect(page).to have_content("Order #{order_1.id}: $#{order_1.price}")
    expect(page).to have_content("Order #{order_2.id}: $#{order_2.price}")
  end

  scenario "they don't see orders belonging to a different user" do
    user1 = create(:user_with_orders)
    user2 = create(:user_with_orders)
    order_1 = user2.orders.first
    order_2 = user2.orders.last

    visit login_path

    fill_in 'Username', with: user1.username
    fill_in 'Password', with: user1.password
    click_button 'Login'

    visit '/orders'

    expect(page).not_to have_content("Order #{order_1.id}: $#{order_1.price}")
    expect(page).not_to have_content("Order #{order_2.id}: $#{order_2.price}")
  end
end
