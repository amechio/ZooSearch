require 'rails_helper'
RSpec.describe '動物機能', type: :system do
  before do
    # binding.irb
    @user = FactoryBot.create(:user)
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

  describe '動物新規作成機能' do
    context '動物を新規作成した場合' do
      it '作成した動物の詳細画面に遷移する' do
        # binding.irb
        # click_on 'トップページ'
        click_on '動物一覧'
        click_on '新規作成'
        fill_in 'animal[name]', with: '名前'
        fill_in 'animal[english_name]', with: '英名'
        fill_in 'animal[scientific_name]', with: '学名'
        fill_in 'animal[distribution]', with: '生息地'
        fill_in 'animal[content]', with: '説明'
        fill_in 'animal[kingdom]', with: '界'
        fill_in 'animal[phylum]', with: '門'
        fill_in 'animal[animal_class]', with: '網'
        fill_in 'animal[order]', with: '目'
        fill_in 'animal[family]', with: '科'
        fill_in 'animal[genus]', with: '属'
        fill_in 'animal[specy]', with: '種'
        click_on '登録' # ボタンがない
        expect(page).to have_content '新しい動物を登録しました！'
        expect(page).to have_content '名前'
      end
    end
  end

  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みの動物一覧が表示される' do
        # binding.irb
        click_on '動物一覧'
        expect(page).to have_content '動物一覧'
        expect(page).to have_content 'テスト動物1'
        expect(page).to have_content 'テスト動物2'
        expect(page).to have_content 'テスト動物3'
      end
    end
  end

  describe '詳細表示機能' do
    context '任意の動物詳細画面に遷移した場合' do
      it '該当動物の内容が表示される' do
        # binding.irb
        # all('.option_btn')[0].click  #テスト動物1の詳細ボタン
        all('#show_btn')[0].click  #テスト動物1の詳細ボタン
        # expect(page).to have_content '詳細画面'
        expect(page).to have_content 'テスト動物1'
      end
    end
  end

  describe '検索機能' do
    context '動物名であいまい検索をした場合' do # 検索できない(T_T)
      it '検索キーワードを動物名に含む動物で絞り込まれる' do
        # binding.irb
        # fill_in 'q[name_cont]', with: 'テスト動物園1' # 動物名もqになってる(´-ω-`)
        # find(".animal_name").set("テスト動物1")
        find('.animal_name').set('テスト動物1')
        click_on '動物を検索'
        # zoo_list = all('.zoo_name')
        # expect(zoo_list[0].text).to eq @zoo.name
        expect(page).to have_content 'テスト動物1'
        expect(page).to_not have_content 'テスト動物2'
        expect(page).to_not have_content 'テスト動物3'
      end
    end

    context '絶滅危惧種検索をした場合' do # 検索できない(T_T)
      it '絶滅危惧種に完全一致する動物が絞り込まれる' do
        # binding.irb
        # select "絶滅危惧Ｉ類 (CR+EN) : 絶滅の危機に瀕している種", from: 'p[endangered_specy_eq]'
        select '絶滅危惧Ｉ類(CR+EN) : 絶滅の危機に瀕している種', from: 'p_endangered_specy_eq'
        # select '北海道', from: 'p_endangered_specy_eq'
        click_on '動物を検索'
        expect(page).to have_content 'テスト動物1'
        expect(page).to_not have_content 'テスト動物2'
        expect(page).to_not have_content 'テスト動物3'
      end
    end
  end
end
