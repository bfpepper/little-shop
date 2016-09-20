require 'rails_helper'

RSpec.feature 'Visitor can get to new account page' do
  scenario 'they can get to new account page' do
    visit '/'
    expect(page).to have_content('Login')

    click_link 'Login'
    expect(current_path).to eq(login_path)

    find("input[placeholder='Username']")
    find("input[placeholder='Password']")

    expect(page).to have_content('Create Account')
  end

  scenario 'Visitor can create a new account' do
    visit '/login'
    click_link 'Create Account'

    fill_in('Name', with: 'Corey')
    fill_in('Username', with: 'Cory')
    fill_in('Password', with: 'test')
    fill_in('Password Confirm', with: 'test')

    click_button 'Create Account'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content('Logged in as Cory')
    expect(page).to have_content('Hello, Corey')
    expect(page).to_not have_content('Login')
    expect(page).to have_content('Logout')
  end
end
