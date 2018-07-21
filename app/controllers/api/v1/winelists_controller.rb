class Api::V1::WinelistsController < ApplicationController
  def index
    @winelists = Winelist.all
    render json: @winelists
  end

  def create
    @winelist = Winelist.create(winelist_params)
    render json: @winelist
  end

  def show
    @winelist = Winelist.find(params[:id])
    render json: @winelist
  end

  def destroy
    winelist = Winelist.find(params[:id])
    winelist_wines = WinelistWine.all.where(winelist_id: params[:id])
    winelist_wines.delete_all
    winelist.delete
    render json: winelist
  end

  def update
    winelist = Winelist.find(params[:id])
    winelist.update(winelist_params)
    render json: winelist
  end

  private

  def winelist_params
    params.require(:winelist).permit(:name, :description)
  end
end
