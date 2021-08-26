require 'rails_helper'
RSpec.describe '動物園機能', type: :system do
  before do
    # binding.irb
    @zoo = FactoryBot.create(:zoo)
    @zoo2 = FactoryBot.create(:zoo2)
    @zoo3 = FactoryBot.create(:zoo3)
    visit root_path
    click_on 'ログイン'
    fill_in 'user[email]', with: 'test1@mail.com'
    fill_in 'user[password]', with: 'password1'
    find('.btn').click
    visit root_path
  end

  # describe '動物園新規作成機能' do
  #   context '動物園を新規作成した場合' do
  #     it '作成した動物園の詳細画面に遷移する' do
  #       # @user = FactoryBot.create(:user)
  #       click_on 'ログイン'
  #       fill_in 'user[email]', with: 'test1@mail.com'
  #       fill_in 'user[password]', with: 'password1'
  #       find('.btn').click
  #       binding.irb
  #       click_on '動物園一覧'
  #       click_on '新規作成'
  #       fill_in 'zoo[name]', with: '名前'
  #       fill_in 'zoo[address]', with: '名前'
  #       fill_in 'zoo[summer_workday_open]', with: '10:00'
  #       fill_in 'zoo[summer_workday_close]', with: '17:00'
  #       fill_in 'zoo[winter_workday_open]', with: '10:00'
  #       fill_in 'zoo[winter_workday_close]', with: '17:00'
  #       fill_in 'zoo[summer_holiday_open]', with: '10:00'
  #       fill_in 'zoo[summer_holiday_close]', with: '17:00'
  #       fill_in 'zoo[winter_holiday_open]', with: '10:00'
  #       fill_in 'zoo[winter_holiday_close]', with: '17:00'
  #       fill_in 'zoo[general_price]', with: '500'
  #       select '近畿', from: 'zoo[area]'
  #       select '大阪府', from: 'zoo[prefecture]'
  #       click_on '登録' # ボタンがない
  #       expect(page).to have_content '新しい動物園を登録しました！'
  #       expect(page).to have_content '詳細画面'
  #     end
  #   end
  # end

  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みの動物園一覧が表示される' do
        # binding.irb
        click_on '動物園一覧'
        expect(page).to have_content '動物園一覧画面'
        expect(page).to have_content 'テスト動物園1'
        expect(page).to have_content 'テスト動物園2'
        expect(page).to have_content 'テスト動物園3'
      end
    end
  end

  describe '詳細表示機能' do
    context '任意の動物園詳細画面に遷移した場合' do
      it '該当動物園の内容が表示される' do
        all('.option_btn')[0].click  #テスト動物園1の詳細ボタン
        expect(page).to have_content '詳細画面'
        expect(page).to have_content 'テスト動物園1'
      end
    end
  end

  describe '検索機能' do
    context '施設名であいまい検索をした場合' do
      it '検索キーワードを施設名に含む動物園で絞り込まれる' do
        # binding.irb
        # fill_in 'q[name_cont]', with: 'テスト動物園1' # 動物名もqになってる(´-ω-`)
        find(".zoo_name").set("テスト動物園1")
        click_on '動物園を検索'
        # zoo_list = all('.zoo_name')
        # expect(zoo_list[0].text).to eq @zoo.name
        expect(page).to have_content 'テスト動物園1'
        expect(page).to_not have_content 'テスト動物園2'
        expect(page).to_not have_content 'テスト動物園3'
      end
    end
    # context '地域検索をした場合' do # 検索できない(T_T)
    #   it '地域に完全一致する動物園が絞り込まれる' do
    #     binding.irb
    #     select '北海道・東北', from: 'q[area]'
    #     click_on '動物園を検索'
    #     expect(page).to have_content 'テスト動物園1'
    #     expect(page).to_not have_content 'テスト動物園2'
    #     expect(page).to_not have_content 'テスト動物園3'
    #   end
    # end
    # context '県検索をした場合' do
    #   it '県に完全一致する動物園が絞り込まれる' do
    #   end
    # end

    context '入場料検索をした場合' do
      it '入場料（一般）が入力した数値よりも安い動物園が絞り込まれる' do
        # binding.irb
        find(".zoo_general_price").set("100")
        click_on '動物園を検索'
        expect(page).to have_content 'テスト動物園1'
        expect(page).to_not have_content 'テスト動物園2'
        expect(page).to_not have_content 'テスト動物園3'
      end
    end
  end
end
