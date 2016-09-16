require 'rails_helper'

RSpec.feature 'A visitor removes items from a cart' do
  scenario 'The item is no longer in the cart' do
    item = create(:item)

    visit '/cart'
    visit items_path
    click_on 'Add to Cart'
    click_on 'View Cart'

    click_on 'Remove'
    # !!! expect(page).to have_current_path('/cart')

    # !!! expect(page).to have_css(yep, its green)
    flash_content = "Successfully removed #{item.title} from your cart."
    expect(page).to have_content(flash_content)
    expect(page).to have_link(item.title, href: item_path(item))

    within('#cart-contents') do
      expect(page).not_to have_content(item.title)
    end
  end
end
