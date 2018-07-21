class Api::V1::WinesController < ApplicationController
  def index
    @wines = Wine.all
    render json: @wines
  end

  def show
    @wine = Wine.find(params[:id])
    render json: @wine
  end

  def create
  	@wine = Wine.create(wine_params)
  	render json: @wine
  end

  def destroy
    @wine = Wine.delete(params[:id])
    render json: @wine
  end

  private

  def wine_params
  	params.require(:wine).permit(:name, :primary_category, :origin, :sugar_content, :producer_name, :serving_suggestions, :tasting_note, :image, :varietal, :style)
  end
end
