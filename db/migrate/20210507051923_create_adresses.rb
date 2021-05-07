class CreateAdresses < ActiveRecord::Migration[6.0]
  def change
    create_table :adresses do |t|
      t.string :postal_code
      t.string :prefecture_id
      t.string :place
      t.string :banti
      t.string :building
      t.string :phone
      t.references :order, foreign_key: true
      t.timestamps
    end
  end
end
