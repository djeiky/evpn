class Article < ActiveRecord::Base

  validates_presence_of :title, :body
  belongs_to :article_type

end
