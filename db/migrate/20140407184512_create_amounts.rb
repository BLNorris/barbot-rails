class CreateAmounts < ActiveRecord::Migration
  def change
    create_table :amounts do |t|
      t.integer :ml
      t.integer :ingredient_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
