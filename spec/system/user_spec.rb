require 'rails_helper'
RSpec.describe 'ユーザ機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user2)
    @user3 = FactoryBot.create(:user3)
    visit root_path
  end

  describe 'サインアップ機能' do
    context 'サインアップ機能でユーザを新規作成した場合' do
      it 'ようこそと表示される' do
        # binding.irb
        click_on 'アカウントをつくる'
        fill_in 'user[name]', with: '名前'
        fill_in 'user[email]', with: 'email@mail.com'
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_on '登録'
        expect(page).to have_content 'ようこそ 名前 さん'
      end
    end
  end

  describe 'ログイン機能' do
    context 'ログインしたとき' do
      before do
        click_on 'ログイン'
        fill_in 'user[email]', with: 'test1@mail.com'
        fill_in 'user[password]', with: 'password1'
        find('.btn').click
      end

      it 'ようこそと表示される' do
        # binding.irb
        expect(page).to have_content 'ようこそ テストユーザ1 さん'
      end

      it '自分のマイページに飛べる' do
        click_on 'マイページ'
        expect(page).to have_content 'テストユーザ1 さんのページ'
      end

      it 'ログアウトができる' do
        click_on 'ログアウト'
        expect(page).to have_content 'ログインしていません'
      end
    end
  end

  describe 'ユーザ管理機能' do
    context '管理者ユーザが登録されているとき' do
      before do
        click_on 'ログイン'
        fill_in 'user[email]', with: 'test1@mail.com'
        fill_in 'user[password]', with: 'password1'
        find('.btn').click
      end

      it '一般ユーザはユーザ一覧画面にアクセスできない' do
        click_on 'ログアウト'
        click_on 'ログイン'
        fill_in 'user[email]', with: 'test2@mail.com'
        fill_in 'user[password]', with: 'password2'
        find('.btn').click
        visit users_path
        expect(page).to have_content 'トップページ'
      end

      it '管理者ユーザはユーザ一覧画面にアクセスできる' do
        click_on 'ユーザ一覧'
        expect(page).to have_content 'ユーザ一覧画面'
      end

      it '管理者ユーザはユーザの新規登録ができる' do
        click_on 'ユーザ一覧'
        click_on '新規作成'
        
      end
      it '管理者ユーザはユーザの編集画面からユーザを編集できる' do
      end
      it '管理者ユーザはユーザの削除をできる' do
      end
    end
  end
end
