class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.text :desc
      t.string :type
      t.string :info

      t.timestamps
    end
  end
end
