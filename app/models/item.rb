class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :send_time

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :price
  end

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :condition_id
    validates :fee_id
    validates :prefecture_id
    validates :send_time_id
  end

  validates :price, format: { with: /([0-9].*[0-9])/, message: 'Half-width number' }
  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000, message: 'Out of setting range' }

  def was_attached?
    image.attached?
  end
end
