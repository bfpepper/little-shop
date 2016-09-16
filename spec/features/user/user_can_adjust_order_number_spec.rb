require 'rails_helper'

RSpec.feature 'User can adjust the quantity of an item' do
  scenario 'they can change how many of an item they want to buy' do
    item = create(:item)

    visit items_path
    click_on 'Add to Cart'

    visit cart_path
    expect(page).to have_content('Quantity: 1')

    click_button('+')

    expect(current_path).to eq(cart_path)
    expect(page).to have_content('Quantity: 2')
    expect(page).to have_content("Subtotal: $#{item.price * 2}")
    expect(page).to have_content("Total: $#{item.price * 2}")

    click_button('-')

    expect(current_path).to eq(cart_path)
    expect(page).to have_content('Quantity: 1')
    expect(page).to have_content("Subtotal: $#{item.price}")
    expect(page).to have_content("Total: $#{item.price}")
  end
end
