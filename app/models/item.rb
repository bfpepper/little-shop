class Item < ApplicationRecord
  belongs_to :category
  has_many :order_items
  has_many :orders, through: :order_items
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  # validates :price, presence: true, :numericality => true,
  #           :format => { :with => /^\d{1,4}(\.\d{0,2})?$/ }
end
