class Level < ApplicationRecord
  has_many :want_levels, dependent: :destroy
  has_many :wants, through: :want_levels
end
