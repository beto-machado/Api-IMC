class ImcsController < ApplicationController

  def index
    @imcs = Imc.all
  end

  def calculate_imc
    @imc = Imc.new(imc_params)
    if @imc.save
      render 'calculate_imc', status: :created
    else
      render json: { errors: @imc.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def imc_params
    params.require(:imc).permit(:height, :weight)
  end
end
