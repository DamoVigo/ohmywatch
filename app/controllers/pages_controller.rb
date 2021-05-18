class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @background = 'background_anrvus.jpg'
  end
end
