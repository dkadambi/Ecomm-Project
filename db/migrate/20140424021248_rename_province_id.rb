class RenameProvinceId < ActiveRecord::Migration
  def self.up
    rename_column :customers, :province_id_id, :province_id
  end
end
