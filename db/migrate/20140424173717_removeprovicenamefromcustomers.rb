class Removeprovicenamefromcustomers < ActiveRecord::Migration
  def change
    remove_column :customers, :province
  end
end
