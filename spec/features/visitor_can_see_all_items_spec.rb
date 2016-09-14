require 'rails_helper'

RSpec.feature "Visitor can see all items" do
  scenario "they see the page for all items" do
    item = create(:item)

    visit items_path

    expect(page).to have_content(item.title)
  end
end
