class AddUserIdAndColorGroupIdToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipes, :user, null: false, foreign_key: true
    add_column :recipes, :color_group_id, :integer, null: false
  end
end
