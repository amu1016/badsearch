class City < ApplicationRecord
  belongs_to :prefecture
  has_many :clubs

  validates :name, presence: true
end