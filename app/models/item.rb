class Item < ApplicationRecord
  has_one_attached :image
  
  with_options precense: true do
     validates :name
      validates :item_text
      validates :price
    with_options numericality:{other_than:0} do
      validates :category_id
      validates :status_id
      validates :shipping_id
      validates :day_id
    end
  end
end
