class Want < ApplicationRecord
  belongs_to :club
  has_many :want_levels, dependent: :destroy
  has_many :levels, through: :want_levels
  has_many :want_ages, dependent: :destroy
  has_many :ages, through: :want_ages
  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sex
end
