class Recipe < ApplicationRecord
  serialize :color_group_ids, Array

  validates :title, presence: true
  validates :instructions, presence: true

  belongs_to :user
  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients
  has_one_attached :image

  # 任意でカスタムバリデーションを追加することができます
  # 例えば、color_group_idsが特定の範囲内の値のみを含むことを確認するなど
end
