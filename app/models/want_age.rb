class WantAge < ActiveRecord::Base
  belongs_to :want
  belongs_to :age
end