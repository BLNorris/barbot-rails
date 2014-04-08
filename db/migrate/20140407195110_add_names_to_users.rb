class AddNamesToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :fname, :lname
    end
  end
end
