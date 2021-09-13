class Prefecture < ApplicationRecord
  has_many :cities
  has_many :users
  has_many :clubs

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end