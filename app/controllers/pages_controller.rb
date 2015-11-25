class PagesController < ApplicationController
  def index
#    @products = Product.all
  end

  def cabinet
    if user_signed_in?
      @left_menus = Menu.where(:name => "cabinet_menu").first
      @title = "Кабинет - #{@title}"
      render "cabinet"
    else
      redirect_to new_user_session_path
    end
  end

  def news_items
    news_type = ArticleType.where(name: "news").first
    if news_type
      @news_items = news_type.articles
    else
      @news_items = {}
    end
  end
end
