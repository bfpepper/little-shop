require 'rails_helper'

RSpec.feature "A visitor visits a category page" do
  scenario "they see all items assigned to that category" do
    category = Category.create(name:"decrepit")
    category.items.create(title:"Old Shoe", description:"Found in back stairwell", price:"94.00", image:"http://imgur.com/oldshoe.jpg")
    category.items.create(title:"Rotting bike tire", description:"Found in back stairwell", price:"94.00", image:"http://imgur.com/oldshoe.jpg")

    visit '/decrepit'

    expect(page).to have_content("Old Shoe")
    expect(page).to have_content("Rotting bike tire")
  end
end
# Background: I have two categories with titles and each has two different items assigned
#
#   As a visitor
#   When I visit "/:CATEGORY_NAME"
#   I see all items assigned to that category
