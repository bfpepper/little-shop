require 'rails_helper'

RSpec.feature 'An authenticated user can only see their page and info' do
  scenario 'they cannot see other users page' do
    user_1 = create(:user)
    user_2 = create(:user)

    visit login_path

    fill_in 'Username', with: user_1.username
    fill_in 'Password', with: user_1.password
    click_on 'Save Session'

    visit dashboard_path
    expect(page).to have_content("Name: #{user_1.name}")

    visit "/users/#{user_2.id}"
    expect(page).to_not have_content('user_2.id')
  end
end
