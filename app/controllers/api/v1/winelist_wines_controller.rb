class Api::V1::WinelistWinesController < ApplicationController
  def index
	   winelist_wines = WinelistWine.all
       render json: winelist_wines
	end

  def create
    winelist = Winelist.find(winelist_wine_params[:winelist_id])
   	wine = winelist.wines.create(
      name: winelist_wine_params[:wine][:name],
   		description: winelist_wine_params[:wine][:tasting_notes],
   		image: winelist_wine_params[:wine][:image_path],
      region: winelist_wine_params[:wine][:region],
      grape: winelist_wine_params[:wine][:grape]
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
    params.require(:winelist_wine).permit(:wine_id, :winelist_id, wine: [:name, :tasting_notes, :image_path, :region, :grape])
	end
end
