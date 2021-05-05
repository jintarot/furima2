class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :prefecture
  belongs_to :shipping
  has_one_attached :image
  with_options precense: true do
    validates :name,:text,:price
  end
  with_options numericality:{other_than:0} do
    validates :category,:days,:status,:prefecture
  end
end
