class BookReview < ApplicationRecord
    mount_uploader :avatar, AvatarUploader 
    paginates_per 10
    has_rich_text :review
end
