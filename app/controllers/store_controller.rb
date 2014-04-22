class StoreController < ApplicationController
  def index
    @categories = Category.order(:name)
    @product = Product.all
  end
  
  def show
    #@product = Product.find(params[:id])
    #@products = Product.find_by_category_id(params[:id])
    @products = Product.where(category_id: params[:id])
  end
  
  def search
    @categories = Category.all
  end
  
  # using the ? instead of just keywords in where clause protects against sql injection
  def search_results
    @found_products = Product.keyword_search(params[:search_keywords],params[:searchables])
    
    #keywords = "%" + params[:search_keywords] + "%"
    #@found_products = Product.where("name LIKE ? OR description LIKE ?", keywords, keywords)
  end
  
  
end
