require 'rails_helper'

RSpec.feature 'Authenticated user logs in' do
  scenario 'they see the dashboard and their username' do
    user = create(:user)
    # As a visitor
    # When I visit "/"
    visit '/'
    # Then I should see a link for "Login"
    expect(page).to have_link 'Login', href: '/login'
    # And when I click "Login"
    click_on 'Login'
    # And I should be on the "/login" page
    expect(current_path).to eq('/login')
    # I should see a place to insert my credentials to login
    expect(page).to have_field 'Username'
    expect(page).to have_field 'Password'
    # And I should see a link to "Create Account"
    expect(page).to have_link 'Create Account'
    # And I fill in my desired credentials
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    # And I submit my information
    click_on 'Save Session'
    # Then my current page should be "/dashboard"
    expect(current_path).to eq('/dashboard')
    # And I should see a message in the navbar that says "Logged in as SOME_USER"
    within '.navbar' do
      expect(page).to have_content("Logged in as #{user.username}")
    end
    # And I should see my profile information
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Name: #{user.name}")
    # And I should not see a link for "Login"
    expect(page).not_to have_content('Login')
    # And I should see a link for "Logout"
    expect(page).to have_content('Logout')
  end
end
