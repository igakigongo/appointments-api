class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
    json_response(@doctors)
  end
end
