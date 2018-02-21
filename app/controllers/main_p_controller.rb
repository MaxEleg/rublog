class MainPController < ApplicationController
  def index
    @articles = Article.all
  end
end
