class ProductType < ActiveRecord::Base
  has_many :product_items
  has_attached_file :image, :default_url => "/logo.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
