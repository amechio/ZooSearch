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
        visit admin_users_path
        expect(page).to have_content 'トップページ'
      end

      it '管理者ユーザはユーザ一覧画面にアクセスできる' do
        click_on 'ユーザ一覧'
        expect(page).to have_content 'ユーザ一覧画面'
      end

      it '管理者ユーザはユーザの新規登録ができる' do
        click_on 'ユーザ一覧'
        click_on '新規作成'
        fill_in 'user[name]', with: '名前'
        fill_in 'user[email]', with: 'email@mail.com'
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_on '登録'
        expect(page).to have_content '名前 さんのページ'
      end

      it '管理者ユーザはユーザの編集画面からユーザを編集できる' do
        click_on 'ユーザ一覧'
        all('#edit')[2].click  #user3の編集ボタン
        fill_in 'user[name]', with: '新しい名前'
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_on '更新する'
        expect(page).to have_content '新しい名前 さんのページ'
      end

      it '管理者ユーザはユーザの削除をできる' do
        click_on 'ユーザ一覧'
        page.accept_confirm do
          all('#delete')[2].click  #user3の削除ボタン
        end
        expect(page).to have_content '削除しました！'
      end
    end
  end
  describe 'ゲストログイン機能' do
    context 'ゲストユーザでログインした場合' do
      it 'ようこそと表示される' do
        click_on 'ゲストログイン(一般)'
        expect(page).to have_content 'ようこそ ゲスト さん'
      end
    end
    context 'ゲスト管理者でログインした場合' do
      it 'ようこそと表示される' do
        click_on 'ゲストログイン(管理者)'
        expect(page).to have_content 'ようこそ ゲスト管理者 さん'
      end
    end
  end
end
