class Admin::OrderDetailsController < ApplicationController

  def update
    @order_details = OrderDetail.find(params[:id])
    @order = @order_details.order
    @order_details.update(order_detail_params)
    if @order_details.making_status == "work"
       @order.update(status: "work")
    end
    if @order.order_details.count == @order.order_details.where(making_status: 3).count
       @order.update(status: "preparation")
    end
    redirect_to admin_order_path(@order)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
