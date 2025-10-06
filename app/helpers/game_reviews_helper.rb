module GameReviewsHelper
    def ratings_helper(rating)
        if  rating >= 90
            return "Masterpiece"
        elsif rating >= 80  && rating < 90
            return "Amazing"
        elsif rating >= 70  && rating < 80
            return "Great"
        elsif rating >= 60  && rating < 70
            return "Good"      
        else
            return "Average"
        end
    end
end
