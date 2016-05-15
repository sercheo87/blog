class ArticlesController < ApplicationController
  #before_action :validate_user, except: [:show, :index]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_article, except: [:index, :new, :create]
  before_action :authenticate_editor!, only: [:new, :create, :update]
  before_action :authenticate_admin!, only: [:destroy, :publish]

  #GET /articles
  def index
    @articles = Article.publicados.ultimos
  end

  #GET /articles/:id
  def show
    @article.update_visits_count
    @comment = Comment.new
  end

  #GET /articles/new
  def new
    @article = Article.new
    @categories = Category.all
  end

  #POST /articles
  def create
    #@article = Article.new(title: params[:article][:title], body: params[:article][:body])
    #@article = Article.new(article_params)

    @article = current_user.articles.new(article_params)
    @article.categories = params[:categories]

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

  def publish
    @article.publish!
    redirect_to @article
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
    params.require(:article).permit(:title, :body, :cover, :categories)
  end
end
