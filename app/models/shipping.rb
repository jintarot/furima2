class Shipping < ActiveHash::Base
  self.data = [
    {id:0,name:"-----"},
    {id:1,name:"送料あり"},
    {id:2,name:"送料なし"}
  ]
  include ActiveHash::Associations
  has_many :items
end