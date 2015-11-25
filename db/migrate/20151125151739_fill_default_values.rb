class FillDefaultValues < ActiveRecord::Migration
  def change
    article_type = ArticleType.new(name: "saas")
    article_type.save

    article_type = ArticleType.new(name: "security")
    article_type.save

    article_type = ArticleType.new(name: "news")
    article_type.save

    default_type = ArticleType.first

    articles = Article.all
    articles.each do |a|
      a.article_type = default_type
      a.save
    end


  end
end
