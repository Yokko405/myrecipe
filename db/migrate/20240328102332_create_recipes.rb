class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.text :description
      t.text :instructions, null: false
      t.timestamps
    end
  end
end
