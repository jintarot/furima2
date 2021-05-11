# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
# User
|Column|Type|Options|
|------|----|-------|
|nickname|string||
|email|string|null: false|
|password|string|null: false|
|last_name|string|
|first_name|string|
|last_name_kana|string|
|first_name_kana|string|
|birthdata|data|



# Item
|Column|Type|Options|
|------|----|-------|
|name|string|
|text|string|
|category|integer|
|status|integer|
|shipping|integer|
|area|integer|
|days|integer|
|price|integer|
|user|references|foreign_key: true|
    
  # Order
|Column|Type|Options|
|------|----|-------|
|price|integer|
|user|references|foreign_key: true|
|item|references|foreign_key: true|
  # Address
|Column|Type|Options|
|------|----|-------|
|postal_number|string|
|phone_number|string|
|building|string|
|place|string|
|banti|string|
|prefecture|integer|
|order|references|foreign_key: true|

      
      
* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
