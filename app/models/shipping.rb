class Shipping < ActiveHash::Base
  self.data = [
    {id:0,name:"-----"},
    {id:1,name:"手数料払う"},
    {id:2,name:"払わない"}
  ]
end