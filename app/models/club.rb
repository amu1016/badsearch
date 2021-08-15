class Club < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :prefecture


  with_options presence: true do
    validates :name
    validates :status_id
    validates :since_year
    validates :since_month
    validates :prefecture_id
    validates :city
    validates :gym
    validates :gender_ratio
    validates :beginner_ratio
    validates :age_range
    validates :purpose
    validates :information
  end
end
