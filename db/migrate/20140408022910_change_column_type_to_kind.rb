class ChangeColumnTypeToKind < ActiveRecord::Migration
  def change
    rename_column :ingredients, :type, :kind
  end

end
