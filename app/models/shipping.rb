class Shipping < ActiveHash::Base
  self.data = [
    {id:1,name:"-----"},
    {id:2,name:"手数料払う"},
    {id:3,name:"払わない"}
  ]
end