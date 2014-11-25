class Photo < ActiveRecord::Base
	belongs_to	   :album
	has_many :comments, as: :commentable 
	mount_uploader :image, PictureUploader
end
