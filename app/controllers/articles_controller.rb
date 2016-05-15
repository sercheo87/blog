class ArticlesController < ApplicationController
  #before_action :validate_user, except: [:show, :index]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_article, except: [:index, :new, :create]

  #GET /articles
  def index
    @articles = Article.all
  end

  #GET /articles/:id
  def show
    @article.update_visits_count
    @comment = Comment.new
  end

  #GET /articles/new
  def new
    @article = Article.new
  end

  #POST /articles
  def create
    #@article = Article.new(title: params[:article][:title], body: params[:article][:body])
    #@article = Article.new(article_params)

    @article = current_user.articles.new(article_params)

    # @article.valid?
    # @article.invalid?
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  #PUT /article/:id
  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def edit
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

=begin
  def validate_user
    redirect_to new_user_session_path, notice: 'Necesitas iniciar session'
  end
=end

  def article_params
    params.require(:article).permit(:title, :body, :cover)
  end
end
