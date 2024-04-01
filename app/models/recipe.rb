class Recipe < ApplicationRecord
  validates :title, presence: true
  validates :instructions, presence: true

  belongs_to :user
  has_many :ingredients, dependent: :destroy
  has_one_attached :image

end
