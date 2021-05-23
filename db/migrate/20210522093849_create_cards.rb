class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :card_token
      t.string :customer_token
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
