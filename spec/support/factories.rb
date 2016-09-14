FactoryGirl.define do
  factory :category do
    name

    factory :category_with_items do
      transient do
        items_count 5
      end

      after(:create) do |category, evaluator|
        create_list(:item, evaluator.items_count, category: category)
      end
    end
  end
  
  sequence :name do |n|
    "category_#{n}"
  end
  
  factory :item do
    category
    title
    description 'An item'
    image 'http://imgur.com/oldshoe'
  end

  sequence :title do |n|
    "item_#{n}"
  end
end
