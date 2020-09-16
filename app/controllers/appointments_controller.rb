class AppointmentsController < ApplicationController
  before_action :check_existence, only: %i[create]
  before_action :set_appointment, only: %i[show]

  def index
    @appointments = Appointment.all
    json_response(@appointments)
  end

  def show
    json_response(@appointment)
  end

  def create
    @appointment = Appointment.create!(appointment_params)
    json_response(@appointment, :created)
  end

  private

  def appointment_params
    params.permit(:end_date, :reason, :start_date)
  end

  def check_existence
    start_date = DateTime.parse(params[:start_date])
    result = Appointment.exists?(start_date: [start_date, start_date + 30.minutes])
    json_response({ message: 'the slot is already taken' }, :unprocessable_entity) if result
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end
end
