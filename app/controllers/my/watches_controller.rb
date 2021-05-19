class My::WatchesController < ApplicationController
  def index
    @watches = current_user.watches
  end

  def show
    @watch = current_user.watches.find(params[:id])
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
    @watch = current_user.watches.find(params[:id])
  end

  def update
    @watch = current_user.watches.find(params[:id])
    @watch.user_id = current_user.id
    @watch.update(watch_params)

    redirect_to watch_path(@watch)
  end

  def destroy
    @watch = current_user.watches.find(params[:id])
    @watch.user_id = current_user.id
    @watch.destroy
  end

  private

  def watch_params
    params.require(:watch).permit(:model, :price, :photo)
  end

end
