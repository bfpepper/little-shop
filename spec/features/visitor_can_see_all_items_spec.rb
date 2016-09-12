require 'rails_helper'

RSpec.feature "Visitor can see all items" do
  scenario "they see the page for all items" do
    Item.create(title: "thing", description: "that thing", price: 10.00, image: "www.example.com")

    visit items_path

    expect(page).to have_content("thing")
  end
end
