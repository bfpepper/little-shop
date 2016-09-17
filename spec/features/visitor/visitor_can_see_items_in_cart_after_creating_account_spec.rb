require 'rails_helper'

RSpec.feature 'Visitor can see items in cart after creating account' do
  scenario 'they can see the items after becoming registered user' do
    item = create(:item)

    visit items_path

    click_on 'Add to Cart'

    visit cart_path

    expect(page).to have_link('Login or Create Account to Checkout')
    expect(page).not_to have_button('Checkout')
  end
end
