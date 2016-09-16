require 'rails_helper'

RSpec.feature 'Admin can log in and see the admin dashboard' do
  scenario 'Admin user sees the admin dashboard upon login' do
    user_1 = create(:user, role: 1)

    visit login_path

    fill_in 'Username', with: user_1.username
    fill_in 'Password', with: user_1.password

    click_on 'Save Session'

    expect(current_path).to eq(admin_dashboard_index_path)
    expect(page).to have_content('Admin landing page')
  end
end
