require 'rails_helper'

RSpec.feature 'Admin can log in and see the admin dashboard' do
  scenario 'Admin user sees the admin dashboard upon login' do

    visit login_path

    # When I log in
    fill_in 'Username', with: 'ben'
    fill_in 'Password', with: 'test'

    click_on 'Save Session'

    # Then I am redirected to "/admin/dashboard"
    expect(current_path).to eq(admin_dashboard_path)

  end
end
