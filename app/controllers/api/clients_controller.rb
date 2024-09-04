module Api
  class ClientsController < ApplicationController
    before_action :set_client, only: [:show, :update, :destroy]

    def index
      @clients = Client.includes(:imc).all
    end

    def show
    end

    def create
      @client = Client.new(client_params)

      if @client.save
        render :show, status: :created
      else
        render json: @client.errors, status: :unprocessable_entity
      end
    end

    def update
      if @client.update(client_params)
        render :show
      else
        render json: @client.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @client.destroy
      head :no_content
    end

    private

    def set_client
      @client = Client.includes(:imc).find(params[:id])
    end

    def client_params
      params.require(:client).permit(:name, :height, :weight)
    end
  end
end

