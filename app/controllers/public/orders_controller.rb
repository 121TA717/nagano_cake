class Public::OrdersController < ApplicationController
  def new
    @customer = current_customer
    @order = Order.new
  end

  def confirm
    params[:order][:payment_method] = params[:order][:payment_method].to_i
    @order = Order.new(order_params)
    if params[:order][:address_option] == "0"
      @order.name = current_customer.last_name + current_customer.first_name
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code
    elsif params[:order][:address_option].to_i == 1
      @address = Address.find(params[:address_id][:id])
      @order.name = @address.name
      @order.address = @address.address
      @order.postal_code = @address.postal_code
    elsif params[:order][:address_option].to_i == 2
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    end

     @cart_items = CartItem.all

  end

  def complete

  end

  def create
    params[:order][:payment_method] = params[:order][:payment_method].to_i
    @order = current_customer.orders.new(order_params)
    @order.shipping_cost = 800
    #@order.total_payment = current_customer.cart_items.sum do |cart_item| cart_item.subtotal end
    @order.status = 0
    @order.total_payment = current_customer.cart_items.sum(&:subtotal) + @order.shipping_cost
    @order.save!
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
    @order_detail = OrderDetail.new
    @order_detail.order_id = @order.id
    @order_detail.item_id = cart_item.item.id
    @order_detail.price = cart_item.item.price
    @order_detail.amount = cart_item.amount
    @order_detail.making_status = 0
    @order_detail.save
    end
    @cart_items.destroy_all
    redirect_to orders_complete_path
  end

  def index
    @orders = current_customer.orders


  end

  def show
    @order = current_customer.orders.find(params[:id])
    @order_details = @order.order_details
  end

  private

  private
  def order_params
    params.require(:order).permit(:address, :name, :payment_method, :postal_code)

  end

end
