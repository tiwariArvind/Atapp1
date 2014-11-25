class Comment < ActiveRecord::Base

	belongs_to :commentable, :polymorphic => true
	belongs_to :events
	belongs_to :photos
	belongs_to :users
end
