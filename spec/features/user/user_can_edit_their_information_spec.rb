require 'rails_helper'

RSpec.feature 'User can update their login credentials' do 
  scenario 'they can change their username' do 
    user = create(:user)
    
    visit login_path 
    
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_on 'Save Session'
    
    visit edit_user_path(user)
    
    fill_in 'Username', with: "Bob"
    fill_in 'Password', with: user.password
    fill_in 'Password Confirm', with: user.password
    click_on 'Update Account'
    
    expect(current_path).to eq(user_path(user))
  end
  
  scenario 'they can not update with username blank' do 
    user = create(:user)
    
    visit login_path 
    
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_on 'Save Session'
    
    visit edit_user_path(user)
    
    fill_in "user[username]", with: ""
    click_on 'Update Account'
    
    expect(page).to have_content("Edit Your Info")
  end
end