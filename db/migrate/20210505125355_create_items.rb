class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :text
      t.integer :category_id,       null: false
      t.integer :status_id,         null: false
      t.integer :shipping_id,       null:false
      t.integer :prefecture_id,     null:false
      t.integer :days_id,           null:false
      t.integer :price
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
