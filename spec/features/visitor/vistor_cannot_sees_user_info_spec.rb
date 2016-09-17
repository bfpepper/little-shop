require 'rails_helper'

RSpec.feature 'Visitor cannot see user pages or admin info' do
  scenario 'Visitor cant see registered users/admin info.' do
    user = create(:user)

    visit admin_dashboard_index_path
    expect(page).to have_content('404')
    
    visit "/users/#{user.id}"
    expect(page).to have_content('404')
  end
end

# As an Unuthenticated User
#   I cannot view another user's private data, such as current order, etc.
#   I should be redirected to login/create account when I try to check out.
#   I cannot view the administrator screens or use administrator functionality.
#   I cannot make myself an administrator.
