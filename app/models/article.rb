class Article < ApplicationRecord
	belongs_to :user
 	has_many :comments, dependent: :destroy
	validates :title,
	          presence: true, 
	          length: { 
	          			minimum: 5 
	          		   }

	mount_uploader :image, ImageUploader

	validates_processing_of :image

	validate :image_size_validation
 
	private
	  def image_size_validation
	    errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
	  end

end
