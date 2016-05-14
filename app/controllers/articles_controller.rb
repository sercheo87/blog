class ArticlesController < ApplicationController

  #GET /articles
  def index
    @articles = Article.all
  end

  #GET /articles/:id
  def show
    @article = Article.find(params[:id])
  end

  #GET /articles/new
  def new
    @article = Article.new
  end

  #POST /articles
  def create
    @article = Article.new(title: params[:article][:title], body: params[:article][:body])

    # @article.valid?
    # @article.invalid?
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  #PUT /article/:id
  def update

  end
end
