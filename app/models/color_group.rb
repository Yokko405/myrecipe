# app/models/color_group.rb
class ColorGroup < ActiveHash::Base
  self.data = [
    { id: 1, name: '赤' },
    { id: 2, name: '緑' },
    { id: 3, name: '黄' }
  ]
end