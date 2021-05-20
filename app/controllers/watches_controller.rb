class WatchesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def index
    @background = 'background_anrvus.jpg'
    @watches = Watch.all
    @markers = @watches.geocoded.map do |watch|
      {
        lat: watch.latitude,
        lng: watch.longitude
      }
    end
  end

  def show
    @background = 'background_anrvus.jpg'
    @watch = Watch.find(params[:id])
  end

  def new
    @watch = Watch.new
  end

  def create
    @watch = Watch.new(watch_params)
    @watch.user_id = current_user.id
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
    @watch.user_id = current_user.id
    @watch.update(watch_params)

    redirect_to watch_path(@watch)
  end

  def destroy
    @watch = Watch.find(params[:id])
    @watch.destroy

    redirect_to watches_path
  end

  private

  def watch_params
    params.require(:watch).permit(:model, :price, :photo)
  end
end
