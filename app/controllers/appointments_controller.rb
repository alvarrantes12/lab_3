class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[ show edit update destroy ]
  before_action :set_doctors
  before_action :set_patients

  def index
    @appointments = Appointment.all
  end

  def show; end

  def new
    @appointment = Appointment.new
  end

  def edit; end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      redirect_to appointment_url(@appointment), notice: t("application.was_created", model: t("activerecord.modules.appointments.one"))
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to appointment_url(@appointment), notice: t("application.was_updated", model: t("activerecord.modules.appointments.one"))
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_url, notice: t("application.was_destroyed", model: t("activerecord.modules.appointments.one"))
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def set_doctors
    @doctors = Doctor.all.map { |doctor| ["#{doctor.first_name} , #{doctor.last_name} - #{doctor.code}", doctor.id] }
  end

  def set_patients
    @patients = Patient.all.map { |patient| ["#{patient.first_name} , #{patient.last_name} - #{patient.id_number}", patient.id] }
  end

  def appointment_params
    params.require(:appointment).permit(:date, :doctor_id, :patient_id)
  end
end
