class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :text
      t.string :category
      t.string :status
      t.string :shipping
      t.string :prefecture
      t.string :days
      t.integer :price
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
