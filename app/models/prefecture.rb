class Prefecture < ApplicationRecord
  has_many :cities, dependent: :destroy
  has_many :users, dependent: :destroy
  has_many :clubs, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end