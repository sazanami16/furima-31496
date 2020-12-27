class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  with_options presence: true do
    validates :nick_name
    validates :birth

    with_options format: { with: /\A[一-龥ぁ-ん]/, message: 'Full-width characters'} do
      validates :last_name
      validates :first_name
    end
  
    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'kana Full-width katakana characters'} do
      validates :last_reading
      validates :first_reading
    end
  end

  validates :password, length: { minimum: 6 }, format: { with: /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/, message: 'Include both letters and numbers'}

end
  

