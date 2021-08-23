class Animal < ApplicationRecord
  has_many :affiliations, dependent: :destroy
  has_many :zoos, through: :affiliations

  mount_uploader :photo, ImageUploader

  validates :name, presence: true
  validates :english_name, presence: true
  validates :scientific_name, presence: true
  validates :distribution, presence: true
  validates :content, presence: true
  validates :kingdom, presence: true
  validates :phylum, presence: true
  validates :animal_class, presence: true
  validates :order, presence: true
  validates :family, presence: true
  validates :genus, presence: true
  validates :species, presence: true

  enum endangered_species: {
    "絶滅(EX) : 我が国ではすでに絶滅したと考えられる種":1,
    "野生絶滅 (EW) : 飼育・栽培下あるいは自然分布域の明らかに外側で野生化した状態でのみ 存続している種":2,
    "絶滅危惧Ｉ類 (CR+EN)  : 絶滅の危機に瀕している種":3,
    "絶滅危惧ＩＡ類(CR) : ごく近い将来における野生での絶滅の危険性が極めて高いもの":4,
    "絶滅危惧ＩＢ類(EN) : ＩA類ほどではないが、近い将来における野生での絶滅の危険性が高いもの":5,
    "絶滅危惧II類 (VU) : 絶滅の危険が増大している種":6,
    "準絶滅危惧 (NT) : 現時点での絶滅危険度は小さいが、生息条件の変化によっては「絶滅危惧」に移行する可能性のある種":7,
    "情報不足(DD） : 評価するだけの情報が不足している種":8,
    "絶滅のおそれのある 地域個体群 (LP) : 地域的に孤立している個体群で、絶滅のおそれが高いもの":9
  }
end
