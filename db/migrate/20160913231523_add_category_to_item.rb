class AddCategoryToItem < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :category, foreign_key: true
  end
end
