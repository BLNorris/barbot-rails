class AddDispenserIdToIngredient < ActiveRecord::Migration
  def change
    add_column :ingredients, :dispenser_id, :integer
  end
end
