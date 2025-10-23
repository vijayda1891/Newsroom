class BookReviewsController < ApplicationController
    before_action :authenticate_user!
    set_tab :book_reviews

    set_tab :index, :navigation, :only => %w(index)
    set_tab :fiction, :navigation, :only => %w(fiction)
    set_tab :history, :navigation, :only => %w(history)
    set_tab :non_fiction, :navigation, :only => %w(non_fiction)
    set_tab :mystery, :navigation, :only => %w(mystery)
    set_tab :science, :navigation, :only => %w(science)
    set_tab :romance, :navigation, :only => %w(romance)
    set_tab :spirituality, :navigation, :only => %w(spirituality)
    set_tab :fantasy, :navigation, :only => %w(fantasy)

    def index
        @book_reviews = BookReview.all.page(params[:page])
    end

    def fiction
        @book_reviews = BookReview.where(genre: "Fiction").page(params[:page])
    end

    def history
        @book_reviews = BookReview.where(genre: "History").page(params[:page])
    end

    def non_fiction
        @book_reviews = BookReview.where(genre: "Non-Fiction").page(params[:page])
    end

    def mystery
        @book_reviews = BookReview.where(genre: "Mystery").page(params[:page])
    end

    def science
        @book_reviews = BookReview.where(genre: "Science").page(params[:page])
    end

    def romance
        @book_reviews = BookReview.where(genre: "Romance").page(params[:page])
    end

    def spirituality
        @book_reviews = BookReview.where(genre: "Spirituality").page(params[:page])
    end

    def fantasy
        @book_reviews = BookReview.where(genre: "Fantasy").page(params[:page]) 
    end

    def new
        @book_review = BookReview.new
    end

    def edit
        @book_review = BookReview.friendly.find(params[:id])
    end

    def show 
        @book_review = BookReview.friendly.find(params[:id])
    end

    def create
        @book_review = BookReview.new(book_review_params)
        if @book_review.save
            redirect_to book_reviews_path, notice: "Review saved successfully"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        @book_review = BookReview.find(params[:id])
        if @book_review.update(book_review_params)
            redirect_to book_review_path(@book_review), notice: "Review updated successfully"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    private

    def book_review_params
        params.require(:book_review).permit(:title, :author, :avatar, :rating, :published, :genre, :review)
    end
end
