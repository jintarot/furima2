class Category < ActiveHash::Base
  self.data = [
    {id: 0, name:"--"},
    {id: 1, name:"レディース"},
    {id:2,  name:"メンズ"},
    {id:3,  name:"ベビー・キッズ"},
    {id:4,  name:"インテリア・小物"},
    {id:5,  name:"本・音楽・ゲーム"},
    {id:6,  name:"おもちゃ"}
  ]
  include ActiveHash::Associations
  has_many :items
end