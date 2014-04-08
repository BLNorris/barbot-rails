class AddActiveToIngredients < ActiveRecord::Migration
  def change
    change_table :ingredients do |t|
      t.boolean  :active
    end
  end
end
