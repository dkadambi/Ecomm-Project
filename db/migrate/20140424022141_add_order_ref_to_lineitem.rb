class AddOrderRefToLineitem < ActiveRecord::Migration
  def change
    add_reference :lineitems, :order, index: true
  end
end
