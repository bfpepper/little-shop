require 'rails_helper'

RSpec.feature 'Admin user can create a new item' do
  scenario 'Admin can add items to the store to sell' do
    admin = create(:user, role: 1)
    category = create(:category)

    visit login_path

    fill_in 'Username', with: admin.username
    fill_in 'Password', with: admin.password

    click_button 'Login'

    expect(current_path).to eq(admin_dashboard_index_path)

    click_link('Add item to sell')

    expect(current_path).to eq(new_admin_item_path)

    fill_in 'Title', with: 'New Item'
    fill_in 'Description', with: 'New Description'
    fill_in 'Price', with: 10.00
    page.select category.name, from: 'item[category_id]'
    fill_in 'Image', with: 'www.example.com'

    click_button('Add Item')

    expect(page).to have_content('New Item')
    expect(page).to have_content('New Description')
    expect(page).to have_content('10.00')
  end

  scenario 'Admin can not add new item without attributes' do
    admin = create(:user, role: 1)
    category = create(:category)

    visit login_path

    fill_in 'Username', with: admin.username
    fill_in 'Password', with: admin.password

    click_button 'Login'

    click_link('Add item to sell')

    fill_in 'Title', with: ''
    fill_in 'Description', with: 'New Description'
    fill_in 'Price', with: 10.00
    page.select category.name, from: 'item[category_id]'
    fill_in 'Image', with: 'www.example.com'

    click_button('Add Item')

    expect(page).to have_content('Add a new item that you want to sell')
  end
end
