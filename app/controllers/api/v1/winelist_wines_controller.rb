class Api::V1::WinelistWinesController < ApplicationController
  def index
	   winelist_wines = WinelistWine.all
       render json: winelist_wines
	end

  def create
    winelist = Winelist.find(winelist_wine_params[:winelist_id])
   	wine = winelist.wines.create(
      name: winelist_wine_params[:wine][:name],
   		primary_category: winelist_wine_params[:wine][:primary_category],
   		origin: winelist_wine_params[:wine][:origin],
      sugar_content: winelist_wine_params[:wine][:sugar_content],
      producer_name: winelist_wine_params[:wine][:producer_name],
      serving_suggestions: winelist_wine_params[:wine][:serving_suggestions],
      tasting_note: winelist_wine_params[:wine][:tasting_note],
      image: winelist_wine_params[:wine][:image],
      varietal: winelist_wine_params[:wine][:varietal],
      style: winelist_wine_params[:wine][:style]
    )
   	render json: winelist
  end

	def destroy
		wine_association = WinelistWine.find_by(wine_id: winelist_wine_params[:wine_id], winelist_id: winelist_wine_params[:winelist_id])
		wine_association.delete
		render json: wine_association
	end

  private

	def winelist_wine_params
    params.require(:winelist_wine).permit(:wine_id, :winelist_id, wine: [:name, :primary_category, :origin, :sugar_content, :producer_name, :serving_suggestions, :tasting_note, :image, :varietal, :style])
	end
end
