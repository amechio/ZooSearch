require 'rails_helper'
describe 'ユーザモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context 'ユーザの名前が空の場合' do
      it 'バリデーションにひっかる' do
        user = User.new( name: '', email: 'model@mail.com', password: 'password', password_confirmation: 'password' )
        expect(user).not_to be_valid
      end
    end

    context 'ユーザのメールアドレスが空の場合' do
      it 'バリデーションにひっかかる' do
        user = User.new( name: '名前', email: '', password: 'password', password_confirmation: 'password' )
        expect(user).not_to be_valid
      end
    end
    context 'ユーザのメールアドレスが重複する場合' do
      it 'バリデーションにひっかかる' do
        base_user = User.create( name: '名前1', email: 'model@mail.com', password: 'password', password_confirmation: 'password' )
        user = User.new( name: '名前2', email: 'model@mail.com', password: 'password', password_confirmation: 'password' )
        expect(user).not_to be_valid
      end
    end
    context 'ユーザのメールアドレスがフォーマットに合わない場合' do
      it 'バリデーションにひっかかる' do
        user = User.new( name: '名前', email: 'mail', password: 'password', password_confirmation: 'password' )
        expect(user).not_to be_valid
      end
    end

    context 'ユーザのパスワードが空の場合' do
      it 'バリデーションにひっかかる' do
        user = User.new( name: '名前', email: 'model@mail.com', password: '', password_confirmation: 'password' )
        expect(user).not_to be_valid
      end
    end
    context 'ユーザの確認用パスワードが空の場合' do
      it 'バリデーションにひっかかる' do
        user = User.new( name: '名前', email: 'model@mail.com', password: 'password', password_confirmation: '' )
        expect(user).not_to be_valid
      end
    end
    context 'ユーザのパスワードと確認用パスワードが異なる場合' do
      it 'バリデーションにひっかかる' do
        user = User.new( name: '名前', email: 'model@mail.com', password: 'password', password_confirmation: 'password2' )
        expect(user).not_to be_valid
      end
    end
    context 'ユーザのパスワードが6文字未満の場合' do
      it 'バリデーションにひっかかる' do
        user = User.new( name: '名前', email: 'model@mail.com', password: 'pass', password_confirmation: 'pass' )
        expect(user).not_to be_valid
      end
    end

    context 'ユーザの名前、メールアドレス、パスワードが正しい場合' do
      it 'バリデーションが通る' do
        user = User.new( name: '名前', email: 'model@mail.com', password: 'password', password_confirmation: 'password' )
        expect(user).to be_valid
      end
    end
  end
end
