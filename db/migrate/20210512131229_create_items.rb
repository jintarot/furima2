class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,         null: false
      t.string :item_text,    null: false
      t.integer :category_id
      t.integer :status_id
      t.integer :shipping_id
      t.integer :day_id
      t.integer :price,       null: false
      t.integer :prefecture_id
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
