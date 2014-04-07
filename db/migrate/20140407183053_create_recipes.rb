class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :desc
      t.text :instructions
      t.integer :user_id

      t.timestamps
    end
  end
end
