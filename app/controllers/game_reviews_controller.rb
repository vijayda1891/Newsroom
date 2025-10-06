class GameReviewsController < ApplicationController
    before_action :authenticate_user!
    set_tab :game_reviews

    def index
        @game_reviews = GameReview.order(release: :desc).page(params[:page])
        @recent_Reviews = GameReview.order(created_at: :desc).limit(5)
    end

    def new
        @game_review = GameReview.new
    end

    def show
        @game_review = GameReview.find(params[:id])
    end

    def edit
        @game_review = GameReview.find(params[:id])
    end

    def create
        @game_review = GameReview.new(game_review_params)
        if @game_review.save
            redirect_to game_reviews_path, notice: "Review saved successfully"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        @game_review = GameReview.find(params[:id])
        if @game_review.update(game_review_params)
            redirect_to game_review_path(@game_review), notice: "Review updated successfully"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    private 

    def game_review_params
        params.require(:game_review).permit!
    end
end
