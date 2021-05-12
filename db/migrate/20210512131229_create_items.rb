class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :item_text
      t.integer :category_id
      t.integer :status_id
      t.integer :shipping_id
      t.integer :day_id
      t.string :price
      t.integer :prefecture_id
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
