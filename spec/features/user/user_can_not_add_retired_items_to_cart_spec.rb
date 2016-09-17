require 'rails_helper'

RSpec.feature 'User can not add retired items to cart' do
  scenario 'they will see item retired in place of add to cart' do
    user = create(:user)
    category = create(:category)
    
    Item.create(title: "Sock", 
                       description: "Warms Your Feet",
                       price: 10.00,
                       image: "sock.jpg",
                       retired: true,
                       category_id: category.id)
    
    visit items_path
    
    
    
    
    
    expect(page).not_to have_button("Add to Cart")
    expect(page).to have_content("Item Retired")
    
    
  end
end