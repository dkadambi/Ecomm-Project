class Product < ActiveRecord::Base

  has_many :line_items
  has_many :orders, :through => :line_items
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
  
  def self.keyword_search(keywords, searchables)
    
    keywords = "%" + keywords + "%"
    
    if searchables == ""
      Product.where("name LIKE ? OR description LIKE ?", keywords, keywords)
    else
      Product.where("name LIKE ? AND category_id = ? OR description LIKE ? AND category_id = ?", keywords,searchables,keywords,searchables)
    end
    
  end
  
  def self.status_search(status)
    Product.where("status LIKE ?",status)
  end
  
   #has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage/
  #validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/]
  #do_not_validate_attachment_file_type :image
end
