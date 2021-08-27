FactoryBot.define do
  factory :animal do
    name { 'テスト動物1' }
    english_name { 'テスト英名1' }
    scientific_name { 'テスト学名1' }
    distribution { 'テスト生息地1' }
    endangered_specy { '絶滅危惧Ｉ類(CR+EN) : 絶滅の危機に瀕している種' }
    content { 'テスト動物説明1' }
    kingdom { 'テスト界1' }
    phylum { 'テスト門1' }
    animal_class { 'テスト網1' }
    order { 'テスト目1' }
    family { 'テスト科1' }
    genus { 'テスト属1' }
    specy { 'テスト種1' }
    # association :zoo
  end
  factory :animal2, class: Animal do
    name { 'テスト動物2' }
    english_name { 'テスト英名2' }
    scientific_name { 'テスト学名2' }
    distribution { 'テスト生息地2' }
    endangered_specy { '絶滅危惧II類(VU) : 絶滅の危険が増大している種' }
    content { 'テスト動物説明2' }
    kingdom { 'テスト界2' }
    phylum { 'テスト門2' }
    animal_class { 'テスト網2' }
    order { 'テスト目2' }
    family { 'テスト科2' }
    genus { 'テスト属2' }
    specy { 'テスト種2' }
    # zoo_id { Zoo.first.id }
  end
  factory :animal3, class: Animal do
    name { 'テスト動物3' }
    english_name { 'テスト英名3' }
    scientific_name { 'テスト学名3' }
    distribution { 'テスト生息地3' }
    endangered_specy { '' }
    content { 'テスト動物説明3' }
    kingdom { 'テスト界3' }
    phylum { 'テスト門3' }
    animal_class { 'テスト網3' }
    order { 'テスト目3' }
    family { 'テスト科3' }
    genus { 'テスト属3' }
    specy { 'テスト種3' }
    # zoo_id { Zoo.first.id }
  end
end
