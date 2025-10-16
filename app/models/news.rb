class News < ApplicationRecord
    has_rich_text :content
    mount_uploader :avatar, AvatarUploader
end
