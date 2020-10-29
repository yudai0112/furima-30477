class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :items
  has_one :order
  

  with_options presence: true do
  validates :nickname
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i,message: "半角英数文字入りで"}
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/,message: "全角ひらがなカタカナ漢字で"}
  validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/,message: "全角ひらがなカタカナ漢字で"}
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/,message: "全角カナ入力"}
  validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/,message: "全角カナ入力"}
  validates :birthday
  end
end
