class Want < ApplicationRecord
  belongs_to :club
  has_many :want_levels
  has_many :want_ages

  def levels
    want_levels.map(&:level)
  end

  def ages
    want_ages.map(&:age)
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sex

end
