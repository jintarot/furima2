class Shipping < ActiveHash::Base
  self.deta = {
    {id:0,name:"-----"},
    {id:1,name:"送料あり"},
    {id:2,name:"送料なし"}
  }
  has_many :items
end