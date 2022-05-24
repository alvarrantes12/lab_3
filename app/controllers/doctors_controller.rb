class DoctorsController < ApplicationController
  before_action :set_doctor, only: %i[ show edit update destroy ]
  before_action :set_hospitals

  def index
    @doctors = Doctor.all
  end

  def show
  end

  def new
    @doctor = Doctor.new
  end

  def edit; end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to doctor_url(@doctor), notice: t("application.was_created", model: t("activerecord.modules.doctors.one"))
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @doctor.update(doctor_params)
      redirect_to doctor_url(@doctor), notice:  t("application.was_updated", model: t("activerecord.modules.doctors.one"))
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @doctor.destroy
    redirect_to doctors_url, notice: t("application.was_destroyed", model: t("activerecord.modules.doctors.one"))
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def set_hospitals
    @hospitals = Hospital.all.pluck(:name, :id)
  end

  def doctor_params
    params.require(:doctor).permit(:first_name, :last_name, :code, :specialty, :hospital_id)
  end
end
