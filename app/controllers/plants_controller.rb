class PlantsController < ApplicationController
    def index
        render json: Plant.all, status: :ok
    end

    def show
        plant = Plant.find_by(id:params[:id])
        if plant
            render json: plant, status: :ok
        else
            render json: {error: "Plants not found"}, status: :not_found
        end
    end

    def create
        plant = Plant.create(production_params)
        render json:plant, status: :created
    end

    private

    def production_params
        params.permit(:name, :image, :price)
    end
end