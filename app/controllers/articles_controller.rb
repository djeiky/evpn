class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]

  respond_to :html

  def index
    @articles = Article.all
    respond_with(@articles)
  end

  def show
    add_breadcrumb @article.title, request.path
    respond_with(@article)
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:body)
    end
end
