# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
# User
      string :nickname    
      date   :birth_date      
      string :first_name        
      string :last_name         
      string :last_name_kana
      string :first_name_kana
      string :email
# Item
    string :item_name
      text :item_text
      integer :category
      integer :status
      integer :shipping
      integer :area
      integer :days          
      integer :price        
      references :user
  # Order
      integer :price
      references :item
      references :user
  # Address
      string :postal_number
      string :phone_number
      string :building
      string :place
      integer :place_detail
      integer :area
      references :order
      
* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
