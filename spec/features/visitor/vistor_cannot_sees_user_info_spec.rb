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
