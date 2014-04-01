class AddAttachmentImageNameToProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.attachment :image_name
    end
  end

  def self.down
    drop_attached_file :products, :image_name
  end
end
