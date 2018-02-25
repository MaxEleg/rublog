class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy,:upvote,:downvote]


  def index
    if params[:categories]
      @articles = Article.where(categories: params[:categories]).order(:created_at => :asc).page(params[:page]).per(5).order(:created_at => :desc)
      @cats = Article.select(:categories).where.not(categories: nil).distinct
    else
      @articles = Article.page(params[:page]).per(5).order(:created_at => :desc)
      @cats = Article.select(:categories).where.not(categories: nil).distinct
    end
  end

  def show
  end

  def best
    @articles = Article.page(params[:page]).per(5).order(:cached_votes_up=> :desc)
    @cats = Article.select(:categories).where.not(categories: nil).distinct
    render "index"
  end

  def worst
    @articles = Article.page(params[:page]).per(5).order(:cached_votes_down=> :desc)
    @cats = Article.select(:categories).where.not(categories: nil).distinct
  end

  def new
    @article = Article.new
    if signed_in?
      @article.createdBy = current_user.email
      @article.save
    end
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def upvote
    @article.upvote_from current_user
    redirect_to article_path
  end

  def downvote
    @article.downvote_from current_user
    redirect_to article_path
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :text,:categories,:createdBy,:image)
    end
end
