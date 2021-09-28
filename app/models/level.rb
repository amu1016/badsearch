class Level < ActiveHash::Base
  self.data = [
    {id: 1, name: 'Lv.1'}, {id: 2, name: 'Lv.2'},{id: 3, name: 'Lv.3'}, {id: 4, name: 'Lv.4'}, {id: 5, name: 'Lv.5'},
  ]

  include ActiveHash::Associations
  has_many :wants

end