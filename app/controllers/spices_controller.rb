class SpicesController < ApplicationController

    #GET /spices
    def index
        spices = Spice.all
        render json: spices
    end

    #POST /spices
    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    #PATCH /spices/:id
    def update 
        spice = find_spice
        spice.update(spice_params)
        render json: spice
    end

    #DELETE / SPICES/:id
    def destroy
        spice = find_spice
        spice.destroy
        head :no_content
    end

    private 
    def find_spice
        Spice.find_by(id: params[:id])
    end

    private
    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

end
