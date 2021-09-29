class WantLevel < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :want
  belongs_to_active_hash :level
end