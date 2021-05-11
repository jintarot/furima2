# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
# Users
|Column|Type|Options|
|------|----|-------|
|nickname|string||
|email|string|unique: true,null: false|
|encrypted_password|string|null: false|
|last_name|string|
|first_name|string|
|last_name_kana|string|
|first_name_kana|string|
|birthdata|data|
has_many :items
has_many :orders



# Items
|Column|Type|Options|
|------|----|-------|
|name|string|
|item_text|string|
|category_id|integer|
|status_id|integer|
|shipping_id|integer|
|prefecture_id|integer|
|days_id|integer|
|price|integer|
|user|references|foreign_key: true|

belongs_to: user
has_many: orders
    
  # Orders
|Column|Type|Options|
|------|----|-------|

|user|references|foreign_key: true|
|item|references|foreign_key: true|

belongs_to: user
belongs_to: item
has_many: address

  # Address

|Column|Type|Options|
|------|----|-------|
|postal_number|string|
|phone_number|string|
|building|string|
|place|string|
|place_detail|string|
|prefecture_id|integer|
|order|references|foreign_key: true|

belongs_to: order
      
* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
