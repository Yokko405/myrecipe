class Recipe < ApplicationRecord
  serialize :color_group_ids, Array

  # 栄養カテゴリーの全リスト
  COLOR_GROUPS = [1, 2, 3].freeze

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
        'recipes.title LIKE ? OR recipes.description LIKE ? OR recipes.instructions LIKE ? OR ingredients.name LIKE ?',
        "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"
      ).distinct
    end

    if color_group_id.present?
      color_group_id = color_group_id.to_s
      recipes = recipes.select { |r| r.color_group_ids.include?(color_group_id) }
    end

    recipes
  end

  def missing_nutrient_categories
    # このレシピに設定されている栄養カテゴリーのIDリストを取得
    current_categories_ids = color_group_ids.map(&:to_i)

    # 全カテゴリーのIDから、現在のレシピのカテゴリーIDを減算して、不足しているカテゴリーIDを特定
    COLOR_GROUPS - current_categories_ids
  end

  # categoryを取得して、不足しているcategoryを充足できるレシピを提案する
  def self.suggest_recipes(missing_nutrients)
    # 文字列として保存されている color_group_ids から、
    # 指定された栄養カテゴリーを含むレシピを検索する
    Recipe.all.select do |recipe|
      (recipe.color_group_ids.map(&:to_i) & missing_nutrients).any?
    end
  end
end
