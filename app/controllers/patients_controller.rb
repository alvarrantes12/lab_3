class PatientsController < ApplicationController
  before_action :set_patient, only: %i[ show edit update destroy ]

  def index
    @patients = Patient.all
  end

  def show; end

  def new
    @patient = Patient.new
  end

  def edit; end

  def create
    @patient = Patient.new(patient_params)

    if @patient.save
      redirect_to patient_url(@patient), notice: t("application.was_created", model: t("activerecord.modules.patients.one"))
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @patient.update(patient_params)
      redirect_to patient_url(@patient), notice: t("application.was_updated", model: t("activerecord.modules.patients.one"))
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @patient.destroy
    redirect_to patients_url, notice: t("application.was_destroyed", model: t("activerecord.modules.patients.one"))
  end

  private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :id_number)
  end
end
