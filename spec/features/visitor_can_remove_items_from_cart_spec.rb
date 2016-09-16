require 'rails_helper'

RSpec.feature "A visitor removes items from a cart" do
  scenario "The item is no longer in the cart" do
    item = create(:item)

    visit '/cart'
    visit items_path
    click_on "Add to Cart"
    click_on "View Cart"

    click_on 'Remove'
#!!! expect(page).to have_current_path('/cart')

#!!! expect(page).to have_css(yep, its green)
    expect(page).to have_content("Successfully removed #{item.title} from your cart.")
    expect(page).to have_link(item.title, item_path(item))

    within ("#cart-contents") do
      expect(page).not_to have_content(item.title)
    end
  end

end
#  As a visitor
#  When I visit "/cart"
#  And I click link "Remove"
#  Then my current page should be "/cart"
#  And I should see a message styled in green
#  And the message should say "Successfully removed SOME_ITEM from your cart."
#  And the title "SOME_ITEM" should be a link to that item in case the user wants to add it back
#  And I should not see the item listed in cart
