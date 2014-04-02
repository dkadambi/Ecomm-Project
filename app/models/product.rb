class Product < ActiveRecord::Base
  #has_many :line_items
  #has_many :orders, :through => :line_items
  #belongs_to :category
  
  has_attached_file :image_name, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  do_not_validate_attachment_file_type :image_name
end
