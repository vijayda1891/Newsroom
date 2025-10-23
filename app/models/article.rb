class Article < ApplicationRecord
    has_rich_text :content
    mount_uploader :avatar, AvatarUploader 
    extend FriendlyId
    friendly_id :title, use: :slugged
end
