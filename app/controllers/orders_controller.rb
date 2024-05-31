class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_client, only: [:create]

  def index
    @orders = current_user.orders.order(created_at: :desc)
    # @orders = current_user.orders.includes(:appointment).reject(&:appointment_present?)
  end

  def create
    @order = current_user.orders.create(total_price: 0)
    redirect_to analyses_path(order_id: @order.id)
  end

  def show
    @order = current_user.orders.find(params[:id])
    # if @order.appointment_present?
    #   redirect_to order_path, alert: "This order already has appointment."
    # end
  end

  private

  def check_if_client
    redirect_to root_path, alert: "You are doctor, you dint need the Analyse, you are healthy" unless current_user.role == "client"
  end
end
