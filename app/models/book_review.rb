class BookReview < ApplicationRecord
    mount_uploader :avatar, AvatarUploader 
    paginates_per 10
    has_rich_text :review
    extend FriendlyId
    friendly_id :title, use: :slugged
    has_many :comments, as: :commentable
end
