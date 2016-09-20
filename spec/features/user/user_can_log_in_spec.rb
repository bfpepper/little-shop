require 'rails_helper'

RSpec.feature 'Authenticated user logs in' do
  scenario 'they see the dashboard and their username' do
    user = create(:user)

    visit '/'

    expect(page).to have_link 'Login', href: '/login'
    click_link 'Login'

    expect(current_path).to eq('/login')
    expect(page).to have_field 'Username'
    expect(page).to have_field 'Password'
    expect(page).to have_link 'Create Account'

    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Login'

    expect(current_path).to eq('/dashboard')
    within '.navbar' do
      expect(page).to have_content("Logged in as #{user.username}")
    end
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Hello, #{user.name}")
    expect(page).not_to have_content('Login')
    expect(page).to have_content('Logout')
  end

  scenario 'they can not use bad credentials to log in' do
    user = create(:user)

    visit login_path

    fill_in 'Username', with: "random"
    fill_in 'Password', with: user.password
    click_button 'Login'

    expect(page).to have_content('Login to your account.')
  end
end
