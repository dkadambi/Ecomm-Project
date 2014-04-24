class AddProvinceRefToCustomers < ActiveRecord::Migration
  def change
    add_reference :customers, :province_id, index: true
  end
end
