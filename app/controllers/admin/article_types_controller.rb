class Admin::ArticleTypesController < AdminController

  before_action :set_article_type, only: [:edit, :update, :destroy]

  def index
    @article_types = ArticleType.all
  end

  def new
    @article_type = ArticleType.new
  end

  def create
    @article_type = ArticleType.new(article_type_params)
    if @article_type.save
      redirect_to admin_article_types_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article_type.update(article_type_params)
      redirect_to admin_article_types_path
    else
      render :edit
    end
  end

  def destroy
    @article_type.destroy
    redirect_to admin_article_types_path
  end

  private

  def set_article_type
    @article_type = ArticleType.find params[:id]
  end

  def article_type_params
    params.require(:article_type).permit(:name)
  end
end
