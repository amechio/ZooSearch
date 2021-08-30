class Zoo < ApplicationRecord
  belongs_to :user
  has_many :affiliations, dependent: :destroy
  has_many :animals, through: :affiliations
  has_many :favorite_zoos, dependent: :destroy

  mount_uploader :photo, ImageUploader

  validates :name, presence: true, length: {in: 1..50}
  validates :address, presence: true
  validates :summer_workday_open, presence: true
  validates :summer_workday_close, presence: true
  validates :winter_workday_open, presence: true
  validates :winter_workday_close, presence: true
  validates :summer_holiday_open, presence: true
  validates :summer_holiday_close, presence: true
  validates :winter_holiday_open, presence: true
  validates :winter_holiday_close, presence: true
  validates :general_price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :area, presence: true
  validates :prefecture, presence: true
  validates :home_page, format: /\A#{URI::regexp(%w(http https))}\z/


  validate :summer_workday_close, :start_finish_check1
  validate :winter_workday_close, :start_finish_check2
  validate :summer_holiday_close, :start_finish_check3
  validate :winter_holiday_close, :start_finish_check4
#     def day_after_today
#       # unless summer_workday_open == nil
#         errors.add(:summer_workday_open, 'は今日を入れて過去の日付を入力して下さい') if summer_workday_open(4i) > summer_workday_close(4i)
#       # end
#     end
#
# first?


  def start_finish_check1
    unless summer_workday_close == nil
      if self.summer_workday_open > self.summer_workday_close
        errors.add(:summer_workday_close, "閉園時間は開園時間より遅い時間を選択してください")
      end
    end
  end

  def start_finish_check2
    unless winter_workday_close == nil
      if self.winter_workday_open > self.winter_workday_close
        errors.add(:winter_workday_close, "閉園時間は開園時間より遅い時間を選択してください")
      end
    end
  end

  def start_finish_check3
    unless summer_holiday_close == nil
      if self.summer_holiday_open > self.summer_holiday_close
        errors.add(:summer_holiday_close, "閉園時間は開園時間より遅い時間を選択してください")
      end
    end
  end

  def start_finish_check4
    unless winter_holiday_close == nil
      if self.winter_holiday_open > self.winter_holiday_close
        errors.add(:winter_holiday_close, "閉園時間は開園時間より遅い時間を選択してください")
      end
    end
  end

#
#   # def start_check
#   #   errors.add(:summer_workday_open, "は現在の日時より遅い時間を選択してください") if self.summer_workday_open < Time.now
#   # end
#
#
#   # summer_workday_open < Time.now
#
#
#   validate :test
# def test
#   # errors.add(:summer_workday_open,"エラー") if 10 > 5
#   errors.add(:summer_workday_open,"エラー") if params[:zoo][:summer_workday_open(4i)]
#  > params[:zoo][:summer_workday_close(4i)]
#
# end

# params[:zoo][:summer_workday_open(4i)]









  enum area: {
    北海道・東北:1,
    関東:2,
    中部:3,
    東海:4,
    近畿:5,
    中国:6,
    四国:7,
    九州・沖縄:8
  }
  enum prefecture:{
    北海道:1,

    青森県:2,
    岩手県:3,
    宮城県:4,
    秋田県:5,
    山形県:6,
    福島県:7,

    茨城県:8,
    栃木県:9,
    群馬県:10,
    埼玉県:11,
    千葉県:12,
    東京都:13,
    神奈川県:14,

    新潟県:15,
    富山県:16,
    石川県:17,
    福井県:18,
    山梨県:19,
    長野県:20,
    岐阜県:21,
    静岡県:22,
    愛知県:23,

    三重県:24,
    滋賀県:25,
    京都府:26,
    大阪府:27,
    兵庫県:28,
    奈良県:29,
    和歌山県:30,

    鳥取県:31,
    島根県:32,
    岡山県:33,
    広島県:34,
    山口県:35,

    徳島県:36,
    香川県:37,
    愛媛県:38,
    高知県:39,

    福岡県:40,
    佐賀県:41,
    長崎県:42,
    熊本県:43,
    大分県:44,
    宮崎県:45,
    鹿児島県:46,

    沖縄県:47
  }
end
