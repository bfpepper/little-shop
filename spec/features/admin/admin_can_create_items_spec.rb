require 'rails_helper'

RSpec.feature 'Admin user can create a new item' do
  scenario 'Admin can add items to the store to sell' do

    # As an authenticated Admin:
  admin = create(:user, role: 1)

  visit login_path

  fill_in 'Username', with: admin.username
  fill_in 'Password', with: admin.password

  click_on 'Save Session'

  expect(current_path).to eq(admin_dashboard_index_path)

  click_link('Add item to sell')

  expect(current_path).to eq(admin_items_path)

  # I can create an item.
  # An item must have a title, description and price.
  fill_in 'Title', with: 'New Item'
  fill_in 'description', with: 'New description'
  fill_in 'Price', with: 10.00
  # An item must belong to at least one category.
  fill_in 'Category', with: 'New Category'
  fill_in 'Item Image', with: 'www.example.com'
  end
end


#
# The title and description cannot be empty.
# The title must be unique for all items in the system.
# The price must be a valid decimal numeric value and greater than zero.
# The photo is optional. If not present, a stand-in photo is used. (PAPERCLIP)
