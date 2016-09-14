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
    price 94.00
    image 'http://imgur.com/oldshoe'
  end

  sequence :title do |n|
    "item_#{n}"
  end

  factory :order do |n|
    status "completed"

    factory :order_with_items do
      transient do
        items_count 5
      end

      after(:create) do |order, evaluator|
        create_list(:item, evaluator.items_count, orders: order)
      end
    end
  end
    

end
