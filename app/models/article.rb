class Article < ApplicationRecord
	acts_as_votable
	mount_uploader :image, ImageUploader

end
