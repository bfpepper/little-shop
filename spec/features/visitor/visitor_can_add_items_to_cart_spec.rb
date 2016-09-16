require 'rails_helper'

RSpec.feature 'Visitor can add items to cart' do
  scenario 'they see a cart page with item and total price' do
    item = create(:item)

    visit items_path
    expect(page).to have_button('Add to Cart')
    click_on 'Add to Cart'
    click_on 'View Cart'

    expect(page).to have_current_path(cart_path)
    expect(page).to have_content("#{item.title} | $#{item.price}")
    expect(page).to have_content(item.description)
    expect(page).to have_css("img[src=\"#{item.image}\"]")
    expect(page).to have_content("Total: $#{item.price}")
  end
end
