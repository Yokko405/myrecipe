class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.text :description
      t.text :instructions, null: false
      t.string :color_group_ids # このフィールドは配列を保存するためのカンマ区切りの文字列として使用される
      t.timestamps
    end
  end
end
