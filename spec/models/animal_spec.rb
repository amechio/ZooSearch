require 'rails_helper'
describe '動物モデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context '動物の名前が空の場合' do
      it 'バリデーションにひっかる' do
        animal = Animal.new( name: '', english_name: '英名', scientific_name: '学名', distribution: '分布', content: '説明', kingdom: '界', phylum: '門', animal_class: '網', order: '目', family: '科', genus: '属', species: '種' )
        expect(animal).not_to be_valid
      end
    end

    context '動物の英名が空の場合' do
      it 'バリデーションにひっかる' do
        animal = Animal.new( name: '名前', english_name: '', scientific_name: '学名', distribution: '分布', content: '説明', kingdom: '界', phylum: '門', animal_class: '網', order: '目', family: '科', genus: '属', species: '種' )
        expect(animal).not_to be_valid
      end
    end

    context '動物の学名が空の場合' do
      it 'バリデーションにひっかる' do
        animal = Animal.new( name: '名前', english_name: '英名', scientific_name: '', distribution: '分布', content: '説明', kingdom: '界', phylum: '門', animal_class: '網', order: '目', family: '科', genus: '属', species: '種' )
        expect(animal).not_to be_valid
      end
    end

    context '動物の分布が空の場合' do
      it 'バリデーションにひっかる' do
        animal = Animal.new( name: '名前', english_name: '英名', scientific_name: '学名', distribution: '', content: '説明', kingdom: '界', phylum: '門', animal_class: '網', order: '目', family: '科', genus: '属', species: '種' )
        expect(animal).not_to be_valid
      end
    end

    context '動物の説明が空の場合' do
      it 'バリデーションにひっかる' do
        animal = Animal.new( name: '名前', english_name: '英名', scientific_name: '学名', distribution: '分布', content: '', kingdom: '界', phylum: '門', animal_class: '網', order: '目', family: '科', genus: '属', species: '種' )
        expect(animal).not_to be_valid
      end
    end

    context '動物の界が空の場合' do
      it 'バリデーションにひっかる' do
        animal = Animal.new( name: '名前', english_name: '英名', scientific_name: '学名', distribution: '分布', content: '説明', kingdom: '', phylum: '門', animal_class: '網', order: '目', family: '科', genus: '属', species: '種' )
        expect(animal).not_to be_valid
      end
    end

    context '動物の門が空の場合' do
      it 'バリデーションにひっかる' do
        animal = Animal.new( name: '名前', english_name: '英名', scientific_name: '学名', distribution: '分布', content: '説明', kingdom: '界', phylum: '', animal_class: '網', order: '目', family: '科', genus: '属', species: '種' )
        expect(animal).not_to be_valid
      end
    end

    context '動物の網が空の場合' do
      it 'バリデーションにひっかる' do
        animal = Animal.new( name: '名前', english_name: '英名', scientific_name: '学名', distribution: '分布', content: '説明', kingdom: '界', phylum: '門', animal_class: '', order: '目', family: '科', genus: '属', species: '種' )
        expect(animal).not_to be_valid
      end
    end

    context '動物の目が空の場合' do
      it 'バリデーションにひっかる' do
        animal = Animal.new( name: '名前', english_name: '英名', scientific_name: '学名', distribution: '分布', content: '説明', kingdom: '界', phylum: '門', animal_class: '網', order: '', family: '科', genus: '属', species: '種' )
        expect(animal).not_to be_valid
      end
    end

    context '動物の科が空の場合' do
      it 'バリデーションにひっかる' do
        animal = Animal.new( name: '名前', english_name: '英名', scientific_name: '学名', distribution: '分布', content: '説明', kingdom: '界', phylum: '門', animal_class: '網', order: '目', family: '', genus: '属', species: '種' )
        expect(animal).not_to be_valid
      end
    end

    context '動物の属が空の場合' do
      it 'バリデーションにひっかる' do
        animal = Animal.new( name: '名前', english_name: '英名', scientific_name: '学名', distribution: '分布', content: '説明', kingdom: '界', phylum: '門', animal_class: '網', order: '目', family: '科', genus: '', species: '種' )
        expect(animal).not_to be_valid
      end
    end

    context '動物の種が空の場合' do
      it 'バリデーションにひっかる' do
        animal = Animal.new( name: '名前', english_name: '英名', scientific_name: '学名', distribution: '分布', content: '説明', kingdom: '界', phylum: '門', animal_class: '網', order: '目', family: '科', genus: '属', species: '' )
        expect(animal).not_to be_valid
      end
    end

    context '動物の全ての内容が正しい場合' do
      it 'バリデーションが通る' do
        animal = Animal.new( name: '名前', english_name: '英名', scientific_name: '学名', distribution: '分布', content: '説明', kingdom: '界', phylum: '門', animal_class: '網', order: '目', family: '科', genus: '属', species: '種' )
        expect(animal).to be_valid
      end
    end
  end
end
