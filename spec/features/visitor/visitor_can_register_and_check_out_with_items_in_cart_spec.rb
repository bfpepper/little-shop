require 'rails_helper'

RSpec.feature 'Visitor can add items, register, and checkout' do
  scenario 'they can place their order on the order page after they register' do
    item_1 = create(:item)
    item_2 = create(:item)

    visit items_path
    within "#item_#{item_1.id}" do
      click_on 'Add to Cart'
    end
    visit items_path
    within "#item_#{item_2.id}" do
      click_on 'Add to Cart'
    end
    click_on 'View Cart'
    page.first(:button, '+').click
    click_on 'Login or Create Account to Checkout'

    fill_in('Name', with: 'Bob')
    fill_in('Phone Number', with: '+18015583951')
    fill_in('Username', with: 'bob')
    fill_in('Password', with: 'bob')
    fill_in('Password Confirm', with: 'bob')
    click_button 'Create Account'

    expect(page).to have_current_path(dashboard_path)
    visit cart_path
    click_button 'Checkout'

    expect(page).to have_current_path(orders_path)
    expect(page).to have_content('Order was successfully placed')
  end
end
