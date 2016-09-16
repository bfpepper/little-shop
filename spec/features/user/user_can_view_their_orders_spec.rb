require 'rails_helper'
<<<<<<< HEAD:spec/features/user_can_view_their_orders_spec.rb
RSpec.feature "A user views their orders" do
  scenario "they see all orders belonging to them" do
=======
RSpec.feature 'A user views their orders' do
  scenario 'they see all orders belonging to them' do
>>>>>>> development:spec/features/user/user_can_view_their_orders_spec.rb
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
<<<<<<< HEAD:spec/features/user_can_view_their_orders_spec.rb

=======
>>>>>>> development:spec/features/user/user_can_view_their_orders_spec.rb
  end

  scenario "they don't see orders belonging to a different user" do
  end

  scenario "they see the details of that order" do
    user = create(:user_with_orders)
    order_1 = user.orders.first
    item_1 = create(:item)
    item_2 = create(:item)
    order_item_1 = OrderItem.create!(order_id: order_1.id, item_id: item_1.id)
    order_item_2 = OrderItem.create(order_id: order_1.id, item_id: item_2.id)
    order_item_3 = OrderItem.create(order_id: order_1.id, item_id: item_1.id)
    # As an authenticated user
    visit login_path

    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_on "Save Session"
    # When I visit "/orders"
    visit "/orders"
    # Then I should see my past order
    # And I should see a link to view that order
    expect(page).to have_link("View order", href: order_path(order_1))

    # And when I click that link
    click_link "View order", href: order_path(order_1)
    # Then I should see each item that was ordered with the quantity and line-item subtotals
    expect(page).to have_content("#{2} #{item_1.title} #{item_1.price * 2}")
    expect(page).to have_content("#{1} #{item_2.title} #{item_2.price}")
    # And I should see links to each item's show page
    expect(page).to have_link(item_1.title, href: item_path(item_1))
    expect(page).to have_link(item_2.title, href: item_path(item_2))
    # And I should see the current status of the order **(ordered, paid, cancelled, completed)**
    expect(page).to have_content(order_1.status)
    # And I should see the total price for the order
    expect(page).to have_content(order_1.price)
    # And I should see the date/time that the order was submitted
    expect(page).to have_content(order_1.created_at)
    # If the order was completed or cancelled then I should see a timestamp when the action took place
# expect(page).to_not have_content()
  end
end
