class DashboardController < ApplicationController

  before_action :authenticate_user!, only: [:home]

  set_tab :home

  def index
  end

  def home
    @main_featured = News.find_by(main_featured: true)
    @left_sidebar = News.where(main_featured: false).order(created_at: :desc).limit(2)
    @right_sidebar = News.where(main_featured: false).where.not(id: @left_sidebar.pluck(:id)).order(created_at: :desc).limit(3)
    exclude_ids = @left_sidebar.pluck(:id) + @right_sidebar.pluck(:id)
    @more_news = News.where(main_featured: false).where.not(id: exclude_ids).order(created_at: :desc).limit(12)
    @articles = Article.order(created_at: :desc).limit(4)
    @game_reviews = GameReview.order(created_at: :desc).limit(4)
    @book_reviews = BookReview.order(created_at: :desc).limit(4)
  end
end
