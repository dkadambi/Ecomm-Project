class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
    
    if session[:logged_in] == true
    @customer = Customer.find(session[:login_id])
      flash[:notice] = @customer.province.gst
    else
      redirect_to new_customer_path
    end
  end
  
  def gst
    
  end
  
  def pst

  end
  
  def hst

  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end
  
  def check_out
    
    if session[:logged_in] == true
      @items_id_to_checkout = session[:product_id]
      flash[:notice] = session[:product_id]
      login_id = session[:login_id]
      customer = Customer.find(login_id.to_i)
      
      order = customer.orders.build
      order.status = "new"
      order.save
      
      @items_id_to_checkout.each {|current_item_id|
        product = Product.find(current_item_id.to_i)
        
        line_item = order.line_items.build
        line_item.quantity = 1
        line_item.price = product.price
        line_item.product_id = product.id
        line_item.order_id = order.id
        line_item.save
        
        if line_item.save
          flash[:notice] = 'Checkout Complete!'
          session[:product_id] = ()
        end
      }
    else
      redirect_to customers_path
    end
    
    
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:status, :created_at, :updated_at)
    end
end
