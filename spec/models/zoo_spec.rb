require 'rails_helper'
describe '動物園モデル機能', type: :model do
  describe 'バリデーションのテスト' do
    before do
      @user = FactoryBot.create(:user)
    end
    context '動物園の名前が空の場合' do
      it 'バリデーションにひっかる' do
        zoo = Zoo.new( name: '', address: '住所', summer_workday_open: '10:00', summer_workday_close: '17:00', winter_workday_open: '10:00', winter_workday_close: '17:00', summer_holiday_open: '10:00', summer_holiday_close: '17:00', winter_holiday_open: '10:00', winter_holiday_close: '17:00', general_price: '100', area: '関東', prefecture: '神奈川県', user_id: User.first.id )
        expect(zoo).not_to be_valid
      end
    end

    context '動物園の住所が空の場合' do
      it 'バリデーションにひっかる' do
        zoo = Zoo.new( name: '名前', address: '', summer_workday_open: '10:00', summer_workday_close: '17:00', winter_workday_open: '10:00', winter_workday_close: '17:00', summer_holiday_open: '10:00', summer_holiday_close: '17:00', winter_holiday_open: '10:00', winter_holiday_close: '17:00', general_price: '100', area: '関東', prefecture: '神奈川県', user_id: User.first.id )
        expect(zoo).not_to be_valid
      end
    end

    context '動物園の開園時間が空の場合' do
      it 'バリデーションにひっかる' do
        zoo = Zoo.new( name: '名前', address: '住所', summer_workday_open: '', summer_workday_close: '17:00', winter_workday_open: '10:00', winter_workday_close: '17:00', summer_holiday_open: '10:00', summer_holiday_close: '17:00', winter_holiday_open: '10:00', winter_holiday_close: '17:00', general_price: '100', area: '関東', prefecture: '神奈川県', user_id: User.first.id )
        expect(zoo).not_to be_valid
      end
    end

    context '動物園の入場料（一般）が空の場合' do
      it 'バリデーションにひっかる' do
        zoo = Zoo.new( name: '名前', address: '住所', summer_workday_open: '10:00', summer_workday_close: '17:00', winter_workday_open: '10:00', winter_workday_close: '17:00', summer_holiday_open: '10:00', summer_holiday_close: '17:00', winter_holiday_open: '10:00', winter_holiday_close: '17:00', general_price: '', area: '関東', prefecture: '神奈川県', user_id: User.first.id )
        expect(zoo).not_to be_valid
      end
    end

    context '動物園の地域が空の場合' do
      it 'バリデーションにひっかる' do
        zoo = Zoo.new( name: '名前', address: '住所', summer_workday_open: '10:00', summer_workday_close: '17:00', winter_workday_open: '10:00', winter_workday_close: '17:00', summer_holiday_open: '10:00', summer_holiday_close: '17:00', winter_holiday_open: '10:00', winter_holiday_close: '17:00', general_price: '100', area: '', prefecture: '神奈川県', user_id: User.first.id )
        expect(zoo).not_to be_valid
      end
    end

    context '動物園の県が空の場合' do
      it 'バリデーションにひっかる' do
        zoo = Zoo.new( name: '名前', address: '住所', summer_workday_open: '10:00', summer_workday_close: '17:00', winter_workday_open: '10:00', winter_workday_close: '17:00', summer_holiday_open: '10:00', summer_holiday_close: '17:00', winter_holiday_open: '10:00', winter_holiday_close: '17:00', general_price: '100', area: '関東', prefecture: '', user_id: User.first.id )
        expect(zoo).not_to be_valid
      end
    end

    context '動物園のuser_idが空の場合' do
      it 'バリデーションにひっかる' do
        zoo = Zoo.new( name: '名前', address: '住所', summer_workday_open: '10:00', summer_workday_close: '17:00', winter_workday_open: '10:00', winter_workday_close: '17:00', summer_holiday_open: '10:00', summer_holiday_close: '17:00', winter_holiday_open: '10:00', winter_holiday_close: '17:00', general_price: '100', area: '関東', prefecture: '神奈川県', user_id: '' )
        expect(zoo).not_to be_valid
      end
    end

    context '動物園の名前、住所、開園閉園時間、入場料（一般）、地域、県が正しい場合' do
      it 'バリデーションが通る' do
        zoo = Zoo.new( name: '名前', address: '住所', summer_workday_open: '10:00', summer_workday_close: '17:00', winter_workday_open: '10:00', winter_workday_close: '17:00', summer_holiday_open: '10:00', summer_holiday_close: '17:00', winter_holiday_open: '10:00', winter_holiday_close: '17:00', general_price: '100', area: '関東', prefecture: '神奈川県', user_id: User.first.id )
        expect(zoo).to be_valid
      end
    end
  end
end
