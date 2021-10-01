class WantLevel < ActiveRecord::Base
  belongs_to :want
  belongs_to :level
end