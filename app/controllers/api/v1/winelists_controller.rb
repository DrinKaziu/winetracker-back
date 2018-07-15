class Api::V1::WinelistsController < ApplicationController
  def index
    winelists = Winelist.all
    render json: winelists
  end

  def create
    winelist = Winelist.create(winelist_params)
    render json: winelist
  end

  def show
    winelist = Winelist.find(params[:id])
    render json: winelist
  end

  def destroy
    winelist = winelist.find(params[:id])
    winelist_wines = winelistWine.all.where(winelist_id: params[:id])
    # byebug
    winelist_wines.delete_all
    winelist.delete
    render json: winelist
  end

  def update
    winelist = winelist.find(params[:id])
    winelist.update(winelist_params)
    render json: winelist
  end

  private

  def winelist_params
    params.require(:winelist).permit(:name, :description)
  end
end
