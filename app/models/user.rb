class User < ApplicationRecord
  before_save { self.email = email.downcase }   #大文字で入力されても小文字で保存する

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true,
            length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: true
  has_secure_password #ハッシュ化した文字列で保存、2つの仮装属性使用、authenticateメソッド
  validates :password, presence: true, length: { minimum: 6 }
end