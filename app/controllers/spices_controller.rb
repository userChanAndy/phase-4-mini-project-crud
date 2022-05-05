class SpicesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
#get
    def index
        spices = Spice.all
        render json: spices
    end

    def show
        spice = spice_id
        render json: spice
    end
    def create
        spice = Spice.create(spice_params)
        render json: spice
    end

    def update
        spice = spice_id
        spice.update(spice_params)
        render json: spice
    end

    def destroy
        spice = spice_id
        spice.destroy
        head :no_content
    end

    private
    def spice_id
        Spice.find_by(id: params[:id])
    end
    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
    def render_not_found
        render json: {error: "Spice Not Found"}, status: :not_found
    end

end
