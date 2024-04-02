class Recipe < ApplicationRecord
  serialize :color_group_ids, Array

  validates :title, presence: true, length: { maximum: 255 }
  validates :instructions, presence: true
  belongs_to :user
  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients
  has_one_attached :image

  def self.search(keyword, color_group_id)
    recipes = Recipe.all
  
    if keyword.present?
      recipes = recipes.left_joins(:ingredients).where(
        "recipes.title LIKE ? OR recipes.description LIKE ? OR recipes.instructions LIKE ? OR ingredients.name LIKE ?",
        "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"
      ).distinct
    end
  
    if color_group_id.present?
      color_group_id = color_group_id.to_s
      recipes = recipes.select { |r| r.color_group_ids.include?(color_group_id) }
    end
  
    recipes
  end
end
