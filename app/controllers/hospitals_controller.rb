class HospitalsController < ApplicationController
  before_action :set_hospital, only: %i[ show edit update destroy ]

  def index
    @hospitals = Hospital.all
  end

  def show
  end

  def new
    @hospital = Hospital.new
  end

  def edit
  end

  def create
    @hospital = Hospital.new(hospital_params)

    respond_to do |format|
      if @hospital.save
        format.html { redirect_to hospital_url(@hospital), notice: t('application.created_message', model: t('activerecord.modules.hospital.one')) }
        format.json { render :show, status: :created, location: @hospital }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hospital.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @hospital.update(hospital_params)
        format.html { redirect_to hospital_url(@hospital), notice: t('application.updated_message', model: t('activerecord.modules.hospital.one')) }
        format.json { render :show, status: :ok, location: @hospital }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hospital.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @hospital.destroy

    respond_to do |format|
      format.html { redirect_to hospitals_url, notice: t('application.destroy_message', model: t('activerecord.modules.hospital.one')) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hospital
      @hospital = Hospital.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hospital_params
      params.require(:hospital).permit(:name)
    end
end
