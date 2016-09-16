class CreateOrder < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :status
      t.decimal :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
