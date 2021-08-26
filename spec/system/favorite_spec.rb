require 'rails_helper'
RSpec.describe 'お気に入り機能', type: :system do
  before do
    @zoo = FactoryBot.create(:zoo)
    @zoo2 = FactoryBot.create(:zoo2)
    @zoo3 = FactoryBot.create(:zoo3)
    @animal = FactoryBot.create(:animal)
    @animal2 = FactoryBot.create(:animal2)
    @animal3 = FactoryBot.create(:animal3)
    visit root_path
    click_on 'ログイン'
    fill_in 'user[email]', with: 'test1@mail.com'
    fill_in 'user[password]', with: 'password1'
    find('.btn').click
    visit root_path
  end

  describe '動物園お気に入り機能' do
    context '動物園をお気に入りした場合' do
      it 'お気に入り解除ボタンに変わる' do
        # binding.irb
        all('#show_btn')[0].click  #テスト動物園1の詳細ボタン
        expect(page).to have_content 'テスト動物園1'
        click_on 'お気に入りする'
        expect(page).to have_content 'お気に入り解除する'
      end
    end
    context '動物園をお気に入り解除した場合' do
      it 'お気に入りボタンに変わる' do
        all('#show_btn')[0].click  #テスト動物園1の詳細ボタン
        expect(page).to have_content 'テスト動物園1'
        click_on 'お気に入りする'
        click_on 'お気に入り解除する'
        expect(page).to have_content 'お気に入りする'
      end
    end
  end

  describe '動物お気に入り機能' do
    context '動物をお気に入りした場合' do
      it 'お気に入り解除ボタンに変わる' do
        all('#show_btn')[3].click  #テスト動物1の詳細ボタン
        expect(page).to have_content 'テスト動物1'
        click_on 'お気に入りする'
        expect(page).to have_content 'お気に入り解除する'
      end
    end
    context '動物をお気に入り解除した場合' do
      it 'お気に入りボタンに変わる' do
        all('#show_btn')[3].click  #テスト動物1の詳細ボタン
        expect(page).to have_content 'テスト動物1'
        click_on 'お気に入りする'
        click_on 'お気に入り解除する'
        expect(page).to have_content 'お気に入りする'
      end
    end
  end

  describe 'お気に入り一覧表示機能' do
    context 'マイページに遷移した場合' do
      before do
        all('#show_btn')[0].click  #テスト動物園1の詳細ボタン
        expect(page).to have_content 'テスト動物園1'
        click_on 'お気に入りする'
        visit root_path
        all('#show_btn')[1].click  #テスト動物園2の詳細ボタン
        expect(page).to have_content 'テスト動物園2'
        click_on 'お気に入りする'
        visit root_path
        all('#show_btn')[3].click  #テスト動物1の詳細ボタン
        expect(page).to have_content 'テスト動物1'
        click_on 'お気に入りする'
        visit root_path
        all('#show_btn')[4].click  #テスト動物2の詳細ボタン
        expect(page).to have_content 'テスト動物2'
        click_on 'お気に入りする'
      end
      it 'お気に入りした動物園の一覧が表示される' do
        click_on 'マイページ'
        expect(page).to have_content 'テスト動物園1'
        expect(page).to have_content 'テスト動物園2'
        expect(page).to_not have_content 'テスト動物園3'
      end
      it 'お気に入りした動物の一覧が表示される' do
        click_on 'マイページ'
        expect(page).to have_content 'テスト動物1'
        expect(page).to have_content 'テスト動物2'
        expect(page).to_not have_content 'テスト動物3'
      end
    end
  end
end
