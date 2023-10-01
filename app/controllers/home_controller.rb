class HomeController < ApplicationController
  def index
    @article = Article.first
  end

  def about
    @title = 'Aboutページです'
  end
end