class Product < ActiveRecord::Base
  #has_many :line_items
  #has_many :orders, :through => :line_items
  #belongs_to :category
  
  has_attached_file :image_name
  #validates_attachment_content_type :image_name, :content_type => /\Aimage\/.*\Z/
end
