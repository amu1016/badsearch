class Sex < ActiveHash::Base
  self.data = [
    {id: 0, name: '制限なし'}, {id: 1, name: '男性のみ'}, {id: 2, name: '女性のみ'},
  ]
 
  include ActiveHash::Associations
  has_many :wants
end