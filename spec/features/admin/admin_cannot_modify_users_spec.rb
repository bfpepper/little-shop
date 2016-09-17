require 'rails_helper'

RSpec.feature 'Admin can modify their account data' do
  scenario 'Admin can not modify user data' do
    admin = create(:user, role: 1)
    user = create(:user)

    visit login_path

    fill_in 'Username', with: admin.username
    fill_in 'Password', with: admin.password

    click_on 'Save Session'

    expect(page).to have_content('Modify Account Data')

    click_on 'Modify Account Data'
    expect(current_path).to eq(edit_user_path(admin))
    expect(current_path).not_to eq(edit_user_path(user))

    fill_in 'Password', with: 'new password'
    fill_in 'Password Confirm', with: 'new password'
    click_on 'Update Account'
    click_on 'Logout'

    visit login_path

    fill_in 'Username', with: admin.username
    fill_in 'Password', with: 'new password'

    click_on 'Save Session'

    expect(page).to have_content('Modify Account Data')
  end
end

# As a logged in Admin
# I can modify my account data
# But I cannot modify any other user's account data
