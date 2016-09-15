require "rails_helper"

RSpec.feature "User can adjust the quantity of an item" do
  scenario "they can change how many of an item they want to buy" do

  item = create(:item)
  visit items_path
  click_on "Add to Cart"

  visit cart_path

  expect(page).to have_content("Quantity: 1")

  click_button("+")

  expect(current_path).to eq(cart_path)

  expect(page).to have_content("Quantity: 2")

  expect(page).to have_content("Subtotal: $#{item.price * 2}")
  expect(page).to have_content("Total: $#{item.price * 2}")

  click_button("-")

  expect(current_path).to eq(cart_path)

  expect(page).to have_content("Quantity: 1")

  expect(page).to have_content("Subtotal: $#{item.price}")
  expect(page).to have_content("Total: $#{item.price}")
  end
end

# As a visitor
# When I visit "/cart"
# Then I should see my item with a quantity of 1
# And when I increase the quantity
# Then my current page should be '/cart'
# And that item's quantity should reflect the increase
# And the subtotal for that item should increase
# And the total for the cart should match that increase
# And when I decrease the quantity
# Then my current page should be '/cart'
# And that item's quantity should reflect the decrease
# And the subtotal for that item should decrease
# And the total for the cart should match that decrease
