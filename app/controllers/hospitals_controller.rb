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
        format.html { redirect_to hospital_url(@hospital), notice: "Hospital was successfully created." }
        
      else
        format.html { render :new, status: :unprocessable_entity }
    
      end
    end
  end

 
  def update
    respond_to do |format|
      if @hospital.update(hospital_params)
        format.html { redirect_to hospital_url(@hospital), notice: "Hospital was successfully updated." }

      else
        format.html { render :edit, status: :unprocessable_entity }
   
      end
    end
  end

  def destroy
    @hospital.destroy

    respond_to do |format|
      format.html { redirect_to hospitals_url, notice: "Hospital was successfully destroyed." }
    end
  end

  private
 
    def set_hospital
      @hospital = Hospital.find(params[:id])
    end

    def hospital_params
      params.require(:hospital).permit(:name)
    end
end
