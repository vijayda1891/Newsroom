class ArticlesController < ApplicationController
    before_action :authenticate_user!
    set_tab :articles

    set_tab :index, :navigation, :only => %w(index)
    set_tab :culture, :navigation, :only => %w(culture)
    set_tab :sport, :navigation, :only => %w(sport)
    set_tab :travel, :navigation, :only => %w(travel)

    def index
        @articles = Article.all.page(params[:page])
        @latest_articles = Article.order(created_at: :desc).limit(5)
    end

    def culture
        @articles = Article.where(tag: "Culture").page(params[:page])
    end

    def sport
        @articles = Article.where(tag: "Sport").page(params[:page])
    end

    def travel
        @articles = Article.where(tag: "Travel").page(params[:page])
    end

    def new
        @article = Article.new
    end

    def edit
        @article = Article.friendly.find(params[:id])
    end

    def show 
        @article = Article.friendly.find(params[:id])
    end

    def create
        @article = Article.new(article_params)
        if @article.save
            redirect_to articles_path, notice: "Article saved successfully"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            redirect_to article_path(@article), notice: "Article updated successfully"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    private

    def article_params
        params.require(:article).permit!
    end
end
