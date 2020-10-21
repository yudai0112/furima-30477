class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i,message: "半角英数文字入りで"}
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/,message: "全角ひらがなカタカナ漢字で"}
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/,message: "全角ひらがなカタカナ漢字で"}
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/,message: "全角カナ入力"}
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/,message: "全角カナ入力"}
  validates :birthday, presence: true
end
