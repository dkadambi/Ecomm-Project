class AddProductsRefToLineitem < ActiveRecord::Migration
  def change
    add_reference :lineitems, :product, index: true
  end
end
