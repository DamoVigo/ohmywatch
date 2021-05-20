class MywatchesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def index
    @background = 'background_anrvus.jpg'
    @watches = Watch.where(user: current_user)
    @markers = @watches.geocoded.map do |watch|
      {
        lat: watch.latitude,
        lng: watch.longitude
      }
    end
  end

  private

  def watch_params
    params.require(:watch).permit(:model, :price, :photo)
  end
end
