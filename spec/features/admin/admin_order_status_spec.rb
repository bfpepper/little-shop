require 'rails_helper'

RSpec.feature 'Admin views all orders' do
  scenario 'they see the status of all orders' do
    admin = create(:user, role: 1)
    order_1 = create(:order, status: 'paid')
    order_2 = create(:order)
    order_3 = create(:order)

    visit login_path

    fill_in 'Username', with: admin.username
    fill_in 'Password', with: admin.password

    click_on 'Save Session'

    visit '/dashboard'

    expect(page).to have_content('Ordered: 2')
    expect(page).to have_content('Paid: 1')
    expect(page).to have_content('Cancelled: 0')
    expect(page).to have_content('Completed: 0')

    expect(page).to have_link(href: order_path(order_1))
    expect(page).to have_link(href: order_path(order_2))
    expect(page).to have_link(href: order_path(order_3))

    click_on 'Paid'

    expect(page).to have_link(href: order_path(order_1))
    expect(page).not_to have_link(href: order_path(order_2))

    expect(page).to have_button 'Ordered'
    expect(page).to have_button 'Cancelled'
    expect(page).to have_button 'Completed'
  end
end
# As an Admin
# When I visit the dashboard
# Then I can see a listing of all orders
# And I can see the total number of orders
#   for each status ("Ordered", "Paid", "Cancelled", "Completed")
# And I can see a link for each individual order
# And I can filter orders to display
#   by each status type ("Ordered", "Paid", "Cancelled", "Completed")
# And I have links to transition between statuses
# - I can click on "cancel" on individual orders which are "paid" or "ordered"
# - I can click on "mark as paid" on orders that are "ordered"
# - I can click on "mark as completed" on orders that are "paid"
