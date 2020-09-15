class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
    json_response(@appointments)
  end
end
