class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :status
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end
