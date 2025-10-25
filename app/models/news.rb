class News < ApplicationRecord
    has_rich_text :content
    mount_uploader :avatar, AvatarUploader
    extend FriendlyId
    friendly_id :headline, use: :slugged
    has_many :comments, as: :commentable
end
