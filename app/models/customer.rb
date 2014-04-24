class Customer < ActiveRecord::Base
  belongs_to :province
  has_many :orders
  
  validates_presence_of :first_name, :last_name, :address, :city, :postal_code, :email
  
end
