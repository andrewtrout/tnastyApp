class Post < ActiveRecord::Base  
  validates :caption, presence: true, unless: ->(post){image.present?}

  has_attached_file :image, styles: { :medium => "640x" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end  
