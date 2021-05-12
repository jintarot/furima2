class Category < ActiveHash::Base
  self.data = [
    {id:1,name:"-------"},
    {id:2,name:"レディース"},
    {id:3,name:"メンズ"},
    {id:4,name:"子供"},
    {id:5,name:"電気"},
    {id:6,name:"小物"},
    {id:7,name:"その他"}
  ]
end