class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image
  has_many :comments, dependent: :destroy

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price
  end

  validates :price, numericality: { only_integer: true, message: 'is invalid. Input half-width characters' }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :cost
  belongs_to :prefecture
  belongs_to :delivery_day

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :cost_id
    validates :prefecture_id
    validates :delivery_day_id
  end
end
