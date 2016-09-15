require 'rails_helper'

RSpec.feature "Guest can add items to cart" do
  scenario "unregistered guest can add items to cart" do

    item_1 = create(:item)
    visit items_path
    click_on "Add to Cart"

    visit cart_path

    expect(page).to have_content("#{item_1.title}")

    expect(page).to_not have_button("Checkout")
    expect(page).to have_link("Login or Create Account to Checkout")

    click_link("Login or Create Account to Checkout")

    expect(current_path).to eq(new_user_path)

    fill_in('Name', with: "Corey")
    fill_in('Username', with: 'Cory')
    fill_in('Password', with: 'test')
    fill_in('Password Confirm', with: 'test')

    visit cart_path

    expect(page).to have_content("#{item_1.title}")

  end
end
