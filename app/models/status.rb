class Status < ActiveHash::Base
  self.data = [
    {id: 0, name: ''}, {id: 1, name: '募集中'}, {id: 2, name: '募集停止中'}, 
  ]
 
  include ActiveHash::Associations
  has_many :clubs
end