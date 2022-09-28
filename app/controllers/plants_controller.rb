class PlantsController < ApplicationController
      # disable the wrap parameters feature in an individual controller
  wrap_parameters format: []
  # GET /plants
  def index
    plants = Plant.all
    render json: plants
  end

  # POST /plants
  def create
    plant = Plant.create(name: params[:name], species: params[:species])
    render json: plant, status: :created
  end

  # GET /plants/:id
  def show
    plant = Plant.find_by(id: params[:id])
    if plant
      render json: plant
    else
      render json: { error: "plant not found" }, status: :not_found
    end
  end

    # POST /plants
    def create
      plant = Plant.create(plant_params)
      render json: plant, status: :created
    end
  
    # other controller actions here
  
    private
    # all methods below here are private
  
    def plant_params
      params.permit(:name, :image, :price)
    end
end
