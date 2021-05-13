class Category < ActiveHash::Base
  self.data = [
    {id:0,name:"-------"},
    {id:1,name:"レディース"},
    {id:2,name:"メンズ"},
    {id:3,name:"子供"},
    {id:4,name:"電気"},
    {id:5,name:"小物"},
    {id:6,name:"その他"}
  ]
end