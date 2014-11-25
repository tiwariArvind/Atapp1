class User < ActiveRecord::Base

	has_and_belongs_to_many :events, dependent: :destroy
	has_many :events, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :likes, as: :likeable, dependent: :destroy
    has_many :albums
    has_secure_password

    mount_uploader :photo, PictureUploader

    def self.send_password_reset(user)
    user.password_reset_token=SecureRandom.urlsafe_base64(5)
    user.password_reset_sent_at = Time.zone.now
    user.save!
    UserMailer.password_reset(user).deliver
    end
  end
