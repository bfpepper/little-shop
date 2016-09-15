require 'rails_helper'

RSpec.feature 'Logged in user logs out' do
  scenario 'they see the visitor options' do
    user = create(:user)
    # As a logged in user
    visit '/'
    click_on 'Login'
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_on 'Save Session'
    # When I click "Logout"
    click_on 'Logout'
    # Then I should see see "Login"
    expect(page).to have_link 'Login', href: login_path
    # And I should not see "Logout"
    expect(page).not_to have_content 'Logout'
  end
end
