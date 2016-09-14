require 'rails_helper'

RSpec.feature "Visitor can add items to cart" do
  scenario "they see a cart page with item and total price" do
    item_title       = "Old Shoe"
    item_description = "Found in back stairwell"
    item_price       = 94.00
    item_image       = "http://imgur.com/oldshoe.jpg"
    Item.create(title: item_title, description: item_description, price: item_price, image: item_image)
    #   As a visitor
    #   When I visit any page with an item on it
    visit items_path
    #   I should see a link or button for "Add to Cart"
    expect(page).to have_button("Add to Cart")
    #   When I click "Add to cart" for that item
    click_on "Add to Cart"
    #   And I click a link or button to view cart
    click_on "View Cart"
    #   And my current path should be "/cart"
    expect(page).to have_current_path(cart_items_path)
    #   And I should see a small image, title, description and price for the item I just added
    expect(page).to have_content("#{item_title} | $#{item_price}")
    expect(page).to have_content(item_description)
    expect(page).to have_css("img[src=\"#{item_image}\"]")
    #   And there should be a "total" price for the cart that should be the sum of all items in the cart
    expect(page).to have_content("Total: $#{item_price}")
  end
end
