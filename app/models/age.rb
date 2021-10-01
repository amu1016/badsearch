class Age < ApplicationRecord
  has_many :want_ages, dependent: :destroy
  has_many :wants, through: :want_ages
end
