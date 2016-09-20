require 'rails_helper'

RSpec.feature 'Authenticated user logs in' do
  scenario 'they see the dashboard and their username' do
    user = create(:user)

    visit '/'

    expect(page).to have_link 'Login', href: '/login'
    click_on 'Login'

    expect(current_path).to eq('/login')
    expect(page).to have_field 'Username'
    expect(page).to have_field 'Password'
    expect(page).to have_link 'Create Account'

    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_on 'Save Session'

    expect(current_path).to eq('/dashboard')
    within '.navbar' do
      expect(page).to have_content("Logged in as #{user.username}")
    end
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Hello, #{user.name}")
    expect(page).not_to have_content('Login')
    expect(page).to have_content('Logout')
  end
end
