class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :title
      t.string :street_address
      t.string :city
      t.string :province
      t.string :country
      t.string :phone
      t.string :email
      t.text :additional_information

      t.timestamps
    end
  end
end
