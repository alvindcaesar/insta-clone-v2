class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :post_photo
  has_many :comments, dependent: :destroy

  validate :post_photo_presence

  def post_photo_presence
    errors.add(:post_photo, "can't be empty") unless post_photo.attached?
  end
end
