class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_client, only: [:create]

  def index
    @appointments = current_user.appointments.order(created_at: :desc)
  end

  def new
    @order = Order.find(params[:id])
    @appointment = Appointment.new(order: @order)
    @family_members = current_user.family_members
  end

  def create
    @appointment = current_user.appointments.new(appointment_params)
    if @appointment.save
      redirect_to @appointment, notice: 'Appointment was successfully created.'
    else
      @family_members = current_user.family_members
      @order = Order.find(@appointment.order_id)
      render :new
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def cancel
    @appointment = Appointment.find(params[:id])
    @appointment.cancel!
    redirect_to @appointment, notice: "Appointment was successfully canceled."
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end
  def appointment_params
    params.require(:appointment).permit(:family_member_id, :order_id, :analysis_datetime)
  end

  def check_if_client
    redirect_to root_path, alert: "You are doctor, you dint need the Analyse, you are healthy" unless current_user.role == "client"
  end
end
