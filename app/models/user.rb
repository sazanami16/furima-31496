class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nick_name,     presence: true
  validates :birth    ,     presence: true
  validates :last_name,     presence: true, format: { with: /\A[一-龥ぁ-ん]/, message: 'Full-width characters'}
  validates :first_name,    presence: true, format: { with: /\A[一-龥ぁ-ん]/, message: 'Full-width characters'}
  validates :last_reading,  presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'kana Full-width katakana characters'}
  validates :first_reading, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'kana Full-width katakana characters'}
  validates :password,      length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])[a-z\d]+\z/, message: 'Include both letters and numbers'}
end
