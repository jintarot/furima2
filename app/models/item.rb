class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  with_options presence: true do
      validates :name
      validates :item_text
      validates :image
      validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
    with_options numericality:{other_than:0} do
      validates :category_id
      validates :prefecture_id
      validates :status_id
      validates :shipping_id
      validates :day_id
    end
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :day
  belongs_to :prefecture
  belongs_to :shipping_id
end
