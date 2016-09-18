require 'rails_helper'

RSpec.feature "A visitor looks at one item" do
  scenario "they see the information for that item" do
    item = create(:item)

    visit '/items'

    click_on item.title

    expect(current_path).to eq("/items/#{item.id}")
    expect(page).to have_content(item.title)
    expect(page).to have_content(item.price)
    expect(page).to have_content(item.description)
    expect(page).to have_css("img[src=\"#{item.image}\"]")
    expect(page).to have_button('Add to Cart')
  end
end
