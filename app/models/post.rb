class Post < ActiveRecord::Base 

  belongs_to :user  
  validates :user_id, presence: true 
  validates :caption, presence: true, unless: ->(post){image.present?}

  has_attached_file :image, styles: { :medium => "642x" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
   
  has_many :comments, dependent: :destroy 

end  
