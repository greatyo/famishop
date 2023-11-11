class CreateShoppings < ActiveRecord::Migration[7.0]
  def change
    create_table :shoppings do |t|
      t.references :item, foreign_key: true,null: false
      t.references :user, foreign_key: true,null: false
      t.integer :quantity
      t.timestamps
    end
  end
end
