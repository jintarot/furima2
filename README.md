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
|nickname|string|null: false|
|email|string|unique: true,null: false|
|encrypted_password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthdate|data|null: false|
has_many :items
has_many :orders



# Items
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|item_text|string|
|category_id|integer|null: false|
|status_id|integer|null: false|
|shipping_id|integer|null: false|
|prefecture_id|integer|null: false|
|days_id|integer|null: false|
|price|integer|null: false|
|user|references|foreign_key: true|

belongs_to: user
has_one: orders
    
  # Orders
|Column|Type|Options|
|------|----|-------|

|user|references|foreign_key: true|
|item|references|foreign_key: true|

belongs_to: user
belongs_to: item
has_one: address

  # Address

|Column|Type|Options|
|------|----|-------|
|postal_number|string|null: false|
|phone_number|string|null: false|
|building|string|null: false|
|place|string|null: false|
|place_detail|string|null: false|
|prefecture_id|integer|null: false|
|order|references|foreign_key: true|

belongs_to: order
      
* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
