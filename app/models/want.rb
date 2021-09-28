class Want < ApplicationRecord
  belongs_to :club
  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sex
  belongs_to :level
  belongs_to :age
end
