require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_shipping_address = FactoryBot.build(:order_shipping_address, user_id: user.id, item_id: item.id)
  end

  describe '配送先情報' do
    context '配送先情報を保存できる場合' do
      it '入力項目を全て正しく入力している場合' do
        expect(@order_shipping_address).to be_valid
      end
      it 'buildingが空欄でも登録できる'do
        @order_shipping_address.building = ''
        expect(@order_shipping_address).to be_valid
      end
    end

    context '配送先情報を保存できない場合' do
      it 'user_idが空の場合は保存できない' do
        @order_shipping_address.user_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空の場合は保存できない' do
        @order_shipping_address.item_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'postal_codeが空の場合は保存できない' do
        @order_shipping_address.postal_code = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'postal_codeにハイフンが正しく入力されていない場合は保存できない' do
        @order_shipping_address.postal_code = 1_234_567
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'prefectureが未選択だと出品できない' do
        @order_shipping_address.prefecture_id = 1
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空の場合は保存できない' do
        @order_shipping_address.city = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空の場合は保存できない' do
        @order_shipping_address.address = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephoneが空の場合は保存できない' do
        @order_shipping_address.telephone = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'telephoneが10桁未満だと保存できない' do
        @order_shipping_address.telephone = '123456789'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('Telephone is too short')
      end
      it 'telephoneが12桁以上だと保存できない' do
        @order_shipping_address.telephone = '1234567891011'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('Telephone is too short')
      end
      it 'telephoneが半角数値以外だと保存できない' do
        @order_shipping_address.telephone = 'a123456789'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('Telephone is invalid. Input only number')
      end
      it 'tokenが空の場合は保存できないこと' do
        @order_shipping_address.token = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
