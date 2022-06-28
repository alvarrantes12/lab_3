module Api
  class MedicinesController < ApplicationController
    before_action :set_medicine, only: %i[ show edit update destroy ]
    skip_before_action :verify_authenticity_token

    def index
      @medicines = Medicine.all
    end

    def show; end

    def new
      @medicine = Medicine.new
    end

    def edit; end

    def create
      @medicine = Medicine.new(medicine_params)
      if @medicine.save
        render "api/medicines/show", status: :created
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @medicine.update(medicine_params)
        render "api/medicines/show", status: :created
      else
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      @medicine.destroy
      render "api/medicines/show", status: :created
    end

    private

    def set_medicine
      @medicine = Medicine.find(params[:id])
    end

    def medicine_params
      params.require(:medicine).permit(:name)
    end
  end
end
