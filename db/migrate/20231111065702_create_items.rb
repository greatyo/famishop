class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.integer :unit_quantity, null: false
      t.integer :price, null: false
      t.references :shop, foreign_key: true,null: false
      t.references :category, foreign_key: true,null: false
      t.text :remarks
      t.references :family, foreign_key: true,null: false
      t.timestamps
    end
  end
end
