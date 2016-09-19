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
    image 'http://i.imgur.com/FZbrdyi.jpg'
  end

  sequence :title do |n|
    "item_#{n}"
  end

  factory :user do
    username
    name 'pete'
    password 'password'
    password_confirmation 'password'

    factory :user_with_orders do
      transient do
        orders_count 3
      end

      after(:create) do |user, evaluator|
        create_list(:order, evaluator.orders_count, user: user)
      end
    end
  end

  sequence :username do |n|
    "user_#{n}"
  end

  factory :order do
    status 'ordered'
    user
    price 100.00
  end
end
