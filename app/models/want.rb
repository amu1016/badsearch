class Want < ApplicationRecord
  belongs_to :club
  has_many :want_levels

  def levels
    want_levels.map(&:level)
  end

  has_many :want_ages

  def ages
    want_ages.map(&:age)
  end


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sex
end
