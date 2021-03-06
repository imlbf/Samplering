class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :update, :destroy]

  # GET /places
  # GET /places.json
  def index
    @places = Place.all

    render json: @places
  end

  # GET /places/1
  # GET /places/1.json
  def show
    render json: @place
  end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(place_params)

    if @place.save
      render json: @place, status: :created, location: @place
    else
      render json: @place.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    @place = Place.find(params[:id])

    if @place.update(place_params)
      head :no_content
    else
      render json: @place.errors, status: :unprocessable_entity
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy

    head :no_content
  end

  private

    def set_place
      begin
       @place = Place.find(params[:id])
      rescue ActiveRecord::RecordNotFound  
       render json: {error:"Sorry, this place doesn't exist"}, status: 404
      end
    end

    def place_params
      params.require(:place).permit(:nome, :descricao, :image_url, :endereco)
    end
end
