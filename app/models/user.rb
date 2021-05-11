class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :first_name, format:{with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/,message:"is invalid. Input full-width characters."}
    validates :last_name, format:{with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/,message:"is invalid. Input full-width characters."}
    validates :last_name_kana,format:{with:/\A[ァ-ヶー－]+\z/,message:"is invalid. Input full-width characters."}
    validates :first_name_kana,format:{with:/\A[ァ-ヶー－]+\z/,message:"is invalid. Input full-width characters."}
    validates :birthdate
    validates :password,format: { with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i,
      message: "は半角6~12文字英大文字・小文字・数字それぞれ１文字以上含む必要があります"}
  end
end
