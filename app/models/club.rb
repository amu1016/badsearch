class Club < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  has_many :events, dependent: :destroy
  has_one :want, dependent: :destroy
  belongs_to :prefecture
  belongs_to :city

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :status
    
    validates :content, presence: true, unless: :was_attached?

    def was_attached?
      self.images.attached?
    end

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
