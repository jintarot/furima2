class Status < ActiveHash::Base
  self.data = [
    {id:0,name:"--"},
    {id:1,name:"良好"},
    {id:2,name:"普通"},
    {id:3,name:"悪い"}
  ]
end