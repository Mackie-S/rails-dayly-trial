class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @articles = current_user.facorite_articles
  end
end