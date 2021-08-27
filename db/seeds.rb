User.create!([
  { name: 'だいず', email: 'daizu@email.com', password: 'password', password_confirmation: 'password', live_prefecture: '神奈川県', favorite_prefecture: '神奈川県', content: 'デフォルトの管理者ユーザーです！', icon: '', owner: true, admin: true },

  { name: 'とまと', email: 'tomato@email.com', password: 'password', password_confirmation: 'password', live_prefecture: '東京都', favorite_prefecture: '東京都', content: 'デフォルトのユーザーです！', icon: '', owner: false, admin: false },

  { name: 'いちご', email: 'ichigo@email.com', password: 'password', password_confirmation: 'password', live_prefecture: '東京都', favorite_prefecture: '東京都', content: 'デフォルトのユーザーです！', icon: '', owner: false, admin: false },

  { name: 'しめじ', email: 'shimeji@email.com', password: 'password', password_confirmation: 'password', live_prefecture: '東京都', favorite_prefecture: '東京都', content: 'デフォルトのユーザーです！', icon: '', owner: false, admin: false },

  { name: 'ひじき', email: 'hijiki@email.com', password: 'password', password_confirmation: 'password', live_prefecture: '東京都', favorite_prefecture: '東京都', content: 'デフォルトのユーザーです！', icon: '', owner: false, admin: false }
])


Zoo.create!([
  { name: 'はこべ動物園', address: '北海道', content: 'デフォルトの動物園です！', photo: '', summer_workday_open: '10:00', summer_workday_close: '17:00', winter_workday_open: '10:00', winter_workday_close: '17:00', summer_holiday_open: '10:00', summer_holiday_close: '17:00', winter_holiday_open: '10:00', winter_holiday_close: '17:00', general_price: '100', area: '北海道・東北', prefecture: '北海道' },

  { name: 'しろつめくさ動物園', address: '青森県', content: 'デフォルトの動物園です！', photo: '', summer_workday_open: '10:00', summer_workday_close: '17:00', winter_workday_open: '10:00', winter_workday_close: '17:00', summer_holiday_open: '10:00', summer_holiday_close: '17:00', winter_holiday_open: '10:00', winter_holiday_close: '17:00', general_price: '100', area: '北海道・東北', prefecture: '青森県' },

  { name: 'かたばみ動物園', address: '千葉県', content: 'デフォルトの動物園です！', photo: '', summer_workday_open: '10:00', summer_workday_close: '17:00', winter_workday_open: '10:00', winter_workday_close: '17:00', summer_holiday_open: '10:00', summer_holiday_close: '17:00', winter_holiday_open: '10:00', winter_holiday_close: '17:00', general_price: '100', area: '関東', prefecture: '千葉県' },

  { name: 'えのころぐさ動物園', address: '京都府', content: 'デフォルトの動物園です！', photo: '', summer_workday_open: '10:00', summer_workday_close: '17:00', winter_workday_open: '10:00', winter_workday_close: '17:00', summer_holiday_open: '10:00', summer_holiday_close: '17:00', winter_holiday_open: '10:00', winter_holiday_close: '17:00', general_price: '100', area: '近畿', prefecture: '京都府' },

  { name: 'おおばこ動物園', address: '熊本県', content: 'デフォルトの動物園です！', photo: '', summer_workday_open: '10:00', summer_workday_close: '17:00', winter_workday_open: '10:00', winter_workday_close: '17:00', summer_holiday_open: '10:00', summer_holiday_close: '17:00', winter_holiday_open: '10:00', winter_holiday_close: '17:00', general_price: '100', area: '九州・沖縄', prefecture: '熊本県' },
])


Animal.create!([
  { name: 'ライオン', english_name: 'Lion',   scientific_name: 'Panthera leo',
  distribution: 'アンゴラ、ウガンダ、エチオピア、カメルーン、ケニア、コンゴ民主共和国、ザンビア、ジンバブエ、スーダン、スワジランド、セネガル、ソマリア、タンザニア、チャド、中央アフリカ共和国、ナイジェリア、ナミビア、ニジェール、ブルキナ・ファソ、ベナン、ボツワナ、マラウイ、南アフリカ共和国、南スーダン、モザンビーク。ガーナ、ギニア、ギニアビサウ、コートジボアール、トーゴ、マリ共和国、ルワンダでは絶滅したと考えられる。アフガニスタン、アルジェリア、イラク、イラン、エジプト、エリトリア、ガボン、ガンビア、クウェート、コンゴ共和国、サウジアラビア、シエラレオネ、ジブチ、シリア、チュニジア、トルコ、パキスタン、ブルンジ、モーリタニア、モロッコ（西サハラ含む）、ヨルダン、リビア、レソト、レバノンでは絶滅。模式標本の産地（模式産地）は単にアフリカとされていたが、バーバリ地方の沿岸部やコンスタンティーヌ（アルジェリア）とする説もある[4]。壁画などから15,000年前にはヨーロッパ広域にも分布し、5,000年前には少なくともギリシアには分布していたと考えられている。',
  endangered_specy: '絶滅危惧ＩＡ類(CR) : ごく近い将来における野生での絶滅の危険性が極めて高いもの',
  content: 'ライオン (Panthera leo) は、哺乳綱食肉目ネコ科ヒョウ属に分類される食肉類。別名はシシ（獅子）。オスは体重は250kgを超えることもあり、ネコ科ではトラに次いで2番目に大きな種である。現在の主な生息地はアフリカ大陸のサブサハラであり、インドのジル国立公園のインドライオンは絶滅が危惧されている。北アフリカや西南アジアでは有史時代に姿を消している。更新世末期、約1万年前までライオンはヒトに次いで広く分布する大型陸上哺乳類だった。飼育個体は20年以上生きることもあるが、野生のライオンの寿命はより短く、特にオスが10年以上生きることは稀である[要出典]。縄張りをめぐって他のオスと常に争うために傷を負い、それが寿命を大きく縮める原因となる。典型的な生息地はサバンナや草原であるが、茂みや森などに棲む場合もある。ライオンは他のネコ科の動物にはあまり見られない社会性を持っている。メスと子ライオン、そして少数の成熟したオスがプライド（群れ）を形成する。狩りの特徴はメスの集団が連係することであり、おもに大型の有蹄類を襲う。ライオンは捕食者の頂点でありまた象徴的な存在であるが、屍肉も漁ることもある。賢く性質が他のネコ科よりも比較的穏和なため、ライオンがヒトを襲うことはほとんどないが、ライオンによる犠牲者がいることは知られている。世界的に「百獣の王」として有名であり、一般的に最も強い動物であると思われている[12]。オスの外見はたてがみが非常に特徴的であり、容易に認識できる。オスの容貌はあらゆる文化のなかで動物そのもののシンボルとして最も広まっているものの一つであり、実際に全ての動物の中で国獣として選ばれる数はライオンが最も多い。ライオンは後期旧石器時代から描かれており、古くはラスコー洞窟やショーヴェ洞窟の洞窟画などがある。彫刻や絵画、国旗をはじめ、現代の映画や文学などでも広く扱われている。',
  photo: '', kingdom: '動物', phylum: '脊椎動物', animal_class: '哺乳', order: '食肉', family: 'ネコ', genus: 'ヒョウ', specy: 'ライオン', subspecy: '',
  wikipedia: 'https://ja.wikipedia.org/wiki/%E3%83%A9%E3%82%A4%E3%82%AA%E3%83%B3' },

  { name: 'アミメキリン', english_name: 'Giraffe', scientific_name: 'Giraffa camelopardalis',
  distribution: 'アンゴラ、ウガンダ、エチオピア、カメルーン北部、ケニア、コンゴ民主共和国北東部、ザンビア、ジンバブエ、ソマリア、タンザニア、チャド南部、中央アフリカ共和国、ナミビア、ニジェール、ボツワナ、南アフリカ共和国、南スーダン、モザンビーク。マリ共和国では絶滅したと考えられ、エリトリア、ギニア、セネガル、ナイジェリア、モーリタニアでは絶滅[1]。エスワティニ、ルワンダには再導入。',
  endangered_specy: '絶滅危惧II類(VU) : 絶滅の危険が増大している種',
  content: 'キリン (Giraffa camelopardalis) は、哺乳綱偶蹄目（鯨偶蹄目とする説もあり）キリン科キリン属に分類される偶蹄類。',
  photo: '', kingdom: '動物', phylum: '脊椎動物', animal_class: '哺乳', order: '偶蹄', family: 'キリン', genus: 'キリン', specy: 'キリン', subspecy: 'アミメキリン',
  wikipedia: 'https://ja.wikipedia.org/wiki/%E3%82%AD%E3%83%AA%E3%83%B3' },

  { name: 'アジアゾウ', english_name: 'Asian elephant', scientific_name: 'Elephas maximus',
  distribution: 'インド北東部および北西部・中部・南部、インドネシア（スマトラ島、ボルネオ島）、カンボジア、スリランカ、タイ王国、中華人民共和国（雲南省）、ネパール、バングラデシュ南東部、ブータン、ベトナム、マレーシア、ミャンマー、ラオス。パキスタンでは絶滅。模式標本の産地（基準産地・タイプ産地・模式産地）はスリランカ。以前は中華人民共和国北部から、西アジア（メソポタミア地方）にかけて分布していた',
  endangered_specy: '絶滅危惧ＩＡ類(CR) : ごく近い将来における野生での絶滅の危険性が極めて高いもの',
  content: 'アジアゾウ(亜細亜象、Elephas maximus)は、哺乳綱長鼻目ゾウ科アジアゾウ属に分類されるゾウ。アジアゾウ属の模式種。現生種では本種のみでアジアゾウ属を構成する。',
  photo: '', kingdom: '動物', phylum: '脊椎動物', animal_class: '哺乳', order: '長鼻', family: 'ゾウ', genus: 'アジアゾウ', specy: 'アジアゾウ', subspecy: 'スマトラゾウ',
  wikipedia: 'https://ja.wikipedia.org/wiki/%E3%82%A2%E3%82%B8%E3%82%A2%E3%82%BE%E3%82%A6' },

  { name: 'アフリカゾウ', english_name: 'African elephant', scientific_name: 'Loxodonta africana',
  distribution: 'アンゴラ、ウガンダ、エチオピア、エリトリア、ガーナ、ガボン、カメルーン、ギニア、ギニアビサウ、ケニア、コートジボワール、コンゴ共和国、コンゴ民主共和国、ザンビア、シエラレオネ、ジンバブエ、セネガル、ソマリア、赤道ギニア、タンザニア、チャド、中央アフリカ共和国、トーゴ、ナイジェリア、ナミビア、ニジェール、ブルキナファソ、ベナン、ボツワナ、マラウイ、マリ、南アフリカ共和国、南スーダン、モザンビーク、リベリア、ルワンダ。ガンビア、ブルンジ、モーリタニアでは絶滅したが、エスワティニに再導入された。',
  endangered_specy: '絶滅危惧Ｉ類(CR+EN) : 絶滅の危機に瀕している種',
  content: 'アフリカゾウ（阿弗利加象、Loxodonta africana）は、長鼻目ゾウ科アフリカゾウ属に分類されるゾウ。',
  photo: '', kingdom: '動物', phylum: '脊椎動物', animal_class: '哺乳', order: '長鼻', family: 'ゾウ', genus: 'アフリカゾウ', specy: 'アフリカゾウ', subspecy: '',
  wikipedia: 'https://ja.wikipedia.org/wiki/%E3%82%A2%E3%83%95%E3%83%AA%E3%82%AB%E3%82%BE%E3%82%A6' },

  { name: 'モルモット(テンジクネズミ)', english_name: 'Guinea pig', scientific_name: 'Cavia porcellus',
  distribution: '', endangered_specy: '',
  content: 'モルモット（学名: Cavia porcellus、英: guinea pig、蘭: cavia）は、テンジクネズミ属の一種。南米に生息するテンジクネズミ科の野生種が古代インディオのもとで家畜化された種である。温和で比較的飼いやすいため、愛玩用、実験動物として養殖されている齧歯類。日本語で言う「モルモット」は、マーモットを意味するオランダ語「マルモット (marmot)」に由来する。1843年最初に長崎に天竺ネズミを持ち込んだオランダ商人がマーモットと勘違いしたことから生じた呼称である。オランダ語では普通 cavia と言うが、日本ではオランダ商人の語弊が広まった。また、英語やオランダ語で言う「marmot（マーモット）」は、山に生息する他の齧歯（げっし）動物、リス科マーモット属、山鼠またはウッドチャックを意味する。',
  photo: '', kingdom: '動物', phylum: '脊椎動物', animal_class: '哺乳', order: 'ネズミ', family: 'テンジクネズミ', genus: 'テンジクネズミ', specy: 'モルモット', subspecy: '',
  wikipedia: 'https://ja.wikipedia.org/wiki/%E3%83%A2%E3%83%AB%E3%83%A2%E3%83%83%E3%83%88' }
])
