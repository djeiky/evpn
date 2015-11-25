class AddArticleTypeRefToArtilces < ActiveRecord::Migration
  def change
    add_reference :articles, :article_type, index: true
  end
end
