class FavoriteZoo < ApplicationRecord
  belongs_to :user
  belongs_to :zoo
end
