class OrderItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_client

  def create
    @order = current_user.orders.find(params[:order_id])
    @analysis = Analysis.find(params[:analysis_id])
    @order_item = @order.order_items.create(analysis: @analysis)
    @order.update(total_price: @order.total_price + @analysis.price) # Змінив @@analysis на @analysis
    redirect_to order_path(@order)
  end

  private

    # def order_item_params
    #   params.require(:order_item).permit(:order_id, :analysis_id)
    # end
  def check_if_client
    redirect_to root_path, alert: "You are doctor, you dint need the Analyse, you are healthy" unless current_user.role == "client"
  end
end
