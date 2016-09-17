require 'rails_helper'

RSpec.feature 'Admin can log in and redirected to Admin Dashboard' do
  scenario 'Admin sees admin dashboard upon login' do
  admin = create(:user, role: 1)

  visit login_path

  fill_in 'Username', with: admin.username
  fill_in 'Password', with: admin.password

  click_on 'Save Session'

  expect(current_path).to eq(admin_dashboard_index_path)
  expect(page).to have_content('Admin Dashboard')
  end

  scenario 'Registered user does not get to see admin dashboard' do
    user = create(:user)

    visit login_path

    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password

    click_on 'Save Session'

    visit admin_dashboard_index_path

    expect(page).to have_content('404')
    expect(page).to_not have_content('Admin Dashboard')
  end

  scenario 'Visitor does not get to see admin dashboard' do
    visit admin_dashboard_index_path

    expect(page).to have_content('404')
    expect(page).to_not have_content('Admin Dashboard')
  end
end
