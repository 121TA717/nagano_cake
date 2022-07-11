class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end


  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.status == "confirmation"
       @order.order_details.each do |order_detail|
         order_detail.update(making_status: "wait")
       end
    end

    redirect_to admin_order_path
  end

  private

  def order_params
    params.require(:order).permit(:address, :name, :payment_method, :postal_code, :status)
  end
end
