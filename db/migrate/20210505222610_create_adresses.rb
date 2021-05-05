class CreateAdresses < ActiveRecord::Migration[6.0]
  def change
    create_table :adresses do |t|
      t.string :place
      t.string :postal_number
      t.string :phone
      t.integer :banti
      t.integer :area_id
      t.references :order, foreign_key: true
      t.timestamps
    end
  end
end
