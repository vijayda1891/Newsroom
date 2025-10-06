module BookReviewsHelper
    def genre_description(action)
        text = ""    
        if action == "fiction"
            text += "Fiction is the telling of stories which are not real. More specifically, fiction is an imaginative form of narrative, one of the four basic rhetorical modes.Fiction may be either written or oral.
            The ability to create fiction and other artistic works is considered to be a fundamental aspect of human culture."
        elsif action == "non_fiction"
            text += "Nonfiction is an account or representation of a subject which is presented as fact. This presentation may be accurate or not; that is, it can give either a true or a false account of the subject in question.
            However, it is generally assumed that the authors of such accounts believe them to be truthful at the time of their composition. Nonfiction is one of the two main divisions in writing, particularly used in libraries, the other being fiction."
        elsif action == "mystery"
            text += "The mystery genre is a genre of fiction that follows a crime (like a murder or a disappearance) from the moment it is committed to the moment it is solved. Mystery novels are often called “whodunnits” because they turn the reader into a detective trying to figure out the who, what, when, and how of a particular crime. 
            Most mysteries feature a detective or private eye solving a case as the central character."
        elsif action == "history"
            text += "History (from Greek ἱστορία - historia, meaning inquiry, knowledge acquired by investigation) is the discovery, collection, organization, and presentation of information about past events. 
            Scholars who write about history are called historians. It is a field of research which uses a narrative to examine and analyse the sequence of events, and it sometimes attempts to investigate objectively the patterns of cause and effect that determine events. "
        elsif action == "romance"
            text += "Two basic elements comprise every romance novel: a central love story and an emotionally-satisfying and optimistic ending. Both the conflict and the climax of the novel should be directly related to that core theme of developing a romantic relationship, although the novel can also contain subplots that do not specifically relate to the main characters' romantic love. "
        elsif action == "science"
            text += "Science (from the Latin scientia, meaning “knowledge”) is the effort to discover, and increase human understanding of how the physical world works. Through controlled methods, science uses observable physical evidence of natural phenomena to collect data, and analyzes this information to explain what and how things work."
        elsif action == "spirituality"
            text += "Spirituality may refer to almost any kind of meaningful activity, personal growth, or blissful experience. Traditionally, spirituality refers to a process of re-formation of the personality but there is no precise definition of spirituality."
        elsif action == "fantasy"
            text += "Fantasy is a genre that uses magic and other supernatural forms as a primary element of plot, theme, and/or setting. Fantasy is generally distinguished from science fiction and horror by the expectation that it steers clear of technological and macabre themes, respectively, though there is a great deal of overlap between the three "
        else
            text += "Here you'll discover the best book recommendations from the world's most successful and interesting people."                           
        end
        return text
    end

    def render_stars(rating, max_stars = 5)
        output = ""
        full_stars = rating.floor
        half_star = (rating - full_stars) >= 0.5

        full_stars.times do
            output << content_tag(:i, "", class: "bi bi-star-fill") 
        end

        if half_star
            output << content_tag(:i, "", class: "bi bi-star-half") 
        end

        (max_stars - full_stars - (half_star ? 1 : 0)).times do
            output << content_tag(:i, "", class: "bi bi-star") 
        end

        output.html_safe
    end

    def genre_links(review)
        if review.genre == "History"
            return link_to review.genre, history_book_reviews_path, class: "genre-link", data: { turbo: false}
        elsif review.genre == "Fantasy"
            return link_to review.genre, fantasy_book_reviews_path, class: "genre-link", data: { turbo: false}
        elsif review.genre == "Fiction"
            return link_to review.genre, fiction_book_reviews_path, class: "genre-link", data: { turbo: false}
        elsif review.genre == "Non-Fiction"
            return link_to review.genre, non_fiction_book_reviews_path, class: "genre-link", data: { turbo: false}
        elsif review.genre == "Mystery"
            return link_to review.genre, mystery_book_reviews_path, class: "genre-link", data: { turbo: false}
        elsif review.genre == "Science"
            return link_to review.genre, science_book_reviews_path, class: "genre-link", data: { turbo: false}
        elsif review.genre == "Romance"
            return link_to review.genre, romance_book_reviews_path, class: "genre-link", data: { turbo: false}
        elsif review.genre == "Spirituality"
            return link_to review.genre, spirituality_book_reviews_path, class: "genre-link", data: { turbo: false}
        end
    end
end
