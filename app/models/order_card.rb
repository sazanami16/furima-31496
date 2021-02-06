class OrderCard
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :address, :building, :phone_number

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :address
    validates :phone_number
  end
  
  def save
    @order_card = UserItem.create(user_id: user_id, item_id: item_id)
    Order.create(postal_code: postal_code, prefecture: prefecture, city: city, address: address, building: building, phone_number: phone_number, user_item_id: @order_card.id)
  end
end
