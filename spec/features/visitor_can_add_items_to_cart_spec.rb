require 'rails_helper'

RSpec.feature "Visitor can add items to cart" do
  scenario "they see a cart page with item and total price" do
    Item.create(title:"Old Shoe", description:"Found in back stairwell", price:"94.00", image:"http://imgur.com/oldshoe.jpg")
    #   As a visitor
    #   When I visit any page with an item on it
    visit items_path
    #   I should see a link or button for "Add to Cart"
    expect(page).to have_button("Add to Cart")
    #   When I click "Add to cart" for that item
    click_on "Add to cart"
    #   And I click a link or button to view cart
    click_on "View Cart"
    #   And my current path should be "/cart"
    
    #   And I should see a small image, title, description and price for the item I just added
    #   And there should be a "total" price for the cart that should be the sum of all items in the cart
  end
end
