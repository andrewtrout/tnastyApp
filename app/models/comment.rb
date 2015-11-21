class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_attached_file :image, styles: { :medium => "420x" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
