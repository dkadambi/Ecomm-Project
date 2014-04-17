class Product < ActiveRecord::Base
  #has_many :line_items
  #has_many :orders, :through => :line_items
  belongs_to :category
  
  validates_presence_of :name, :description, :price, :stock_quantity, :category_id
  
  has_attached_file :image
  
  def delete_image=(value)
    if value == '1'
      self.image = nil
    end
    
  end
  
  def delete_image
    return '0'
  end
  
  #has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  #validates_attachment_content_type :image, :content_type => /\Aimage/
  #validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/]
  #do_not_validate_attachment_file_type :image
end
