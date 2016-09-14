require 'rails_helper'

RSpec.feature "A visitor visits a category page" do
  scenario "they see all items assigned to that category" do
    category = create(:category_with_items, items_count: 2)
    item_1 = category.items.first.title
    item_2 = category.items.last.title

    visit "/#{category.name}"

    expect(page).to have_content(item_1)
    expect(page).to have_content(item_2)
  end
end
# Background: I have two categories with titles and each has two different items assigned
#
#   As a visitor
#   When I visit "/:CATEGORY_NAME"
#   I see all items assigned to that category
