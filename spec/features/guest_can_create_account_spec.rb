require 'rails_helper'

RSpec.feature "Visitor can get to new account page" do
  scenario "they can get to new account page" do

    # When I visit "/"
    visit '/'

    # Then I should see a link for "Login"
    expect(page).to have_content("Login")

    # And when I click "Login"
    click_link "Login"

    # And I should be on the "/login" page
    expect(current_path).to eq(new_user_path)

    # I should see a place to insert my credentials to login
    # And I should see a link to "Create Account"
    find("input[placeholder='Username']")
    find("input[placeholder='Password']")
    find("input[placeholder='Password Confirm']")

    page.should have_selector("input[type=submit][value='Create Account']")
  end

  scenario "Visitor can create a new account" do

    # When I visit "/login
    visit '/login'

    # And when I click link "Create Account"
    click_link "Create Account"

    # And I fill in my desired credentials
    fill_in('Name', with: "Corey")
    fill_in('Username', with: 'Cory')
    fill_in('Password', with: 'test')
    fill_in('Password Confirm', with: 'test')

    # And I submit my information
    click_button "Create Account"

    # Then my current page should be "/dashboard"
    expect(current_path).to eq("/dashboard")

    # And I should see a message in the navbar that says "Logged in as SOME_USER"
    expect(page).to have_content("Logged in as Cory")

    # And I should see my profile information
    expect(page).to have_content("Welcome Cory")

    # And I should not see a link for "Login"
    expect(page).to not_have_content("Login")

    # And I should see a link for "Logout"
    expect(page).to have_content("Logout")
  end
end
