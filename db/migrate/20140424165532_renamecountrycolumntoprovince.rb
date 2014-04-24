class Renamecountrycolumntoprovince < ActiveRecord::Migration
  def change
    rename_column :customers, :country, :province
  end
end
