class Status < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '新品・未使用' },
    { id: 2, name: '未使用に近い' },
    { id: 3, name: '目立った傷や汚れなし' },
    { id: 4, name: 'やや汚れや傷あり' },
    { id: 5, name: '汚れや傷あり' },
    { id: 6, name: '全体的に悪い' }
  ]

  include ActiveHash::Associations
  has_many :items
end
