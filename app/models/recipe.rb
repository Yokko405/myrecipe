class Recipe < ApplicationRecord
  serialize :color_group_ids, Array
  def self.search(keyword, color_group_id)
    recipes = Recipe.all
    if keyword.present?
      recipes = recipes.where("title LIKE ? OR description LIKE ?", "%#{keyword}%", "%#{keyword}%")
    end
    if color_group_id.present?
      recipes = recipes.select { |r| r.color_group_ids.include?(color_group_id) }
    end
    recipes
  end

  serialize :color_group_ids, Array

  validates :title, presence: true, length: { maximum: 255 }
  validates :instructions, presence: true

  belongs_to :user
  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients
  has_one_attached :image

end
