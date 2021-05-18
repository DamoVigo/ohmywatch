class WatchesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def index
    @background = 'background_anrvus.jpg'
    @watches = Watch.all
  end

  def show
    @watch = Watch.find(params[:id])
  end

  def new
    @watch = Watch.new
  end

  def create
    @watch = Watch.new(watch_params)
    if @watch.save
      redirect_to watches_path
    else
      render :new
    end
  end

  def edit
    @watch = Watch.find(params[:id])
  end

  def update
    @watch = Watch.find(params[:id])
    @watch.update(watch_params)

    redirect_to watch_path(@watch)
  end

  private

  def watch_params
    params.require(:watch).permit(:model, :price, :photo)
  end
end
