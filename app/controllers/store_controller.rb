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
end
