class WantAge < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :want
  belongs_to_active_hash :age
end
