class Event < ActiveRecord::Base
    belongs_to :user
    has_many :likes, as: :likeable
    has_many :comments, as: :commentable, dependent: :destroy
	has_and_belongs_to_many :users
	validates :name, presence: true
end
