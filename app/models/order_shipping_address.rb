class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :telephone, :token

  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }

  with_options presence: true do
    validates :user_id
    validates :item_id

    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :telephone, format: { with: /\A[0-9]{10,11}\z/, message: 'is too short' }
    validates :token
  end
  validates :telephone, numericality: { only_integer: true, message: 'is invalid. Input only number' }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city,
                           address: address, building: building, telephone: telephone)
  end
end
