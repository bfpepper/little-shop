class AddRetiredToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :retired, :boolean, :default => false
  end
end
