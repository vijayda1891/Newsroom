class GameReview < ApplicationRecord
    mount_uploader :avatar, AvatarUploader 
    paginates_per 5
    has_rich_text :review
end
