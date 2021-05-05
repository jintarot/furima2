class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  with_options presence: true do
    validates :name,:price,:text
  end
  validates :image, presence: true
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :prefecture
  belongs_to :shipping
  belongs_to :days
end
