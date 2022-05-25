class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[ show edit update destroy ]
  before_action :set_doctors
  before_action :set_patients
  
  def index
    @appointments = Appointment.all
  end

  
  def show
  end

  
  def new
    @appointment = Appointment.new
  end

  
  def edit
  end

  
  def create
    @appointment = Appointment.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        redirect_to appointment_url(@appointment), notice: "Appointment was successfully created." 
        render :show, status: :created, location: @appointment 
      else
        render :new, status: :unprocessable_entity 
        render json: @appointment.errors, status: :unprocessable_entity 
      end
    end
  end

 
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        redirect_to appointment_url(@appointment), notice: "Appointment was successfully updated." 
        render :show, status: :ok, location: @appointment 
      else
        render :edit, status: :unprocessable_entity 
        render json: @appointment.errors, status: :unprocessable_entity 
      end
    end
  end

  
  def destroy
    @appointment.destroy

    redirect_to appointments_url, notice: "Appointment was successfully destroyed."
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def set_doctors
    @doctors = Doctor.all.map { |doctor| ["#{doctor.first_name} #{doctor.last_name} - #{doctor.code}", doctor.id] }
  end

  def set_patients
    @patients = Patient.all.map { |patient| ["#{patient.first_name} #{patient.last_name} - #{patient.identification_number}", patient.id] }
  end

  def appointment_params
    params.require(:appointment).permit(:date, :doctor_id, :patient_id)
  end
end

