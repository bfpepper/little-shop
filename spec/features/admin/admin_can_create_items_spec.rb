require 'rails_helper'

RSpec.feature 'Admin user can create a new item' do
  scenario 'Admin can add items to the store to sell' do

  admin = create(:user, role: 1)
  category = create(:category)

  visit login_path

  fill_in 'Username', with: admin.username
  fill_in 'Password', with: admin.password

  click_on 'Save Session'

  expect(current_path).to eq(admin_dashboard_index_path)

  click_link('Add item to sell')

  expect(current_path).to eq(new_admin_item_path)

  fill_in 'Title', with: 'New Item'
  fill_in 'Description', with: 'New description'
  fill_in 'Price', with: 10.00
  page.select category.name, from: 'item[category]'
  fill_in 'Image', with: 'www.example.com'

  expect(current_path).to eq(item_path(Item.all.last))
  end
end


#
# The title and description cannot be empty.
# The title must be unique for all items in the system.
# The price must be a valid decimal numeric value and greater than zero.
# The photo is optional. If not present, a stand-in photo is used. (PAPERCLIP)
