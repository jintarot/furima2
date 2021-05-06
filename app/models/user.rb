class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname,:last_name,:first_name
    validates :first_name_kana, format:{with:/\A[ぁ-んァ-ン一-龥]/,message:"is invalid. Input full-width characters."}
    validates :last_name_kana, format:{with:/\A[ぁ-んァ-ン一-龥]/,message:"is invalid. Input full-width characters."}
  end
end
