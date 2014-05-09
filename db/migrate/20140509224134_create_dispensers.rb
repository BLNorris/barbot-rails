class CreateDispensers < ActiveRecord::Migration
  def change
    create_table :dispensers do |t|
      t.integer :position

      t.timestamps
    end
    add_index :dispensers, :position, :unique => true
  end
end
