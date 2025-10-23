class NewsController < ApplicationController
    before_action :authenticate_user!
    set_tab :news

    set_tab :world, :navigation, :only => %w(world)
    set_tab :sport, :navigation, :only => %w(sport)
    set_tab :regional, :navigation, :only => %w(regional)
    set_tab :tech, :navigation, :only => %w(tech)
    set_tab :business, :navigation, :only => %w(business)
    set_tab :entertainment, :navigation, :only => %w(entertainment)

    def index
        @main_featured = News.find_by(main_featured: true)
        @other_news = News.where(main_featured: false).order(created_at: :desc).limit(3)
        @sidebar_news = News.where(main_featured: false).where.not(id: @other_news.pluck(:id)).order(created_at: :desc).limit(2)
        exclude_ids = @other_news.pluck(:id) + @sidebar_news.pluck(:id)
        @more_news = News.where(main_featured: false).where.not(id: exclude_ids).order(created_at: :desc)
    end

    def world
        @main_featured = News.find_by(featured: true, tag: "World")
        @other_news = News.where(featured: false, tag: "World").order(created_at: :desc).limit(3)
        @sidebar_news = News.where(featured: false,  tag: "World").where.not(id: @other_news.pluck(:id)).order(created_at: :desc).limit(2)
        exclude_ids = @other_news.pluck(:id) + @sidebar_news.pluck(:id)
        @more_news = News.where(featured: false, tag: "World").where.not(id: exclude_ids).order(created_at: :desc)
    end

    def sport
        @main_featured = News.find_by(featured: true, tag: "Sport")
        @other_news = News.where(featured: false, tag: "Sport").order(created_at: :desc).limit(3)
        @sidebar_news = News.where(featured: false,  tag: "Sport").where.not(id: @other_news.pluck(:id)).order(created_at: :desc).limit(2)
        exclude_ids = @other_news.pluck(:id) + @sidebar_news.pluck(:id)
        @more_news = News.where(featured: false, tag: "Sport").where.not(id: exclude_ids).order(created_at: :desc) 
    end

    def regional
        @main_featured = News.find_by(featured: true, tag: "Regional")
        @other_news = News.where(featured: false, tag: "Regional").order(created_at: :desc).limit(3)
        @sidebar_news = News.where(featured: false,  tag: "Regional").where.not(id: @other_news.pluck(:id)).order(created_at: :desc).limit(2)
        exclude_ids = @other_news.pluck(:id) + @sidebar_news.pluck(:id)
        @more_news = News.where(featured: false, tag: "Regional").where.not(id: exclude_ids).order(created_at: :desc)
    end

    def tech
        @main_featured = News.find_by(featured: true, tag: "Tech")
        @other_news = News.where(featured: false, tag: "Tech").order(created_at: :desc).limit(3)
        @sidebar_news = News.where(featured: false,  tag: "Tech").where.not(id: @other_news.pluck(:id)).order(created_at: :desc).limit(2)
        exclude_ids = @other_news.pluck(:id) + @sidebar_news.pluck(:id)
        @more_news = News.where(featured: false, tag: "Tech").where.not(id: exclude_ids).order(created_at: :desc) 
    end 

    def business
        @main_featured = News.find_by(featured: true, tag: "Business")
        @other_news = News.where(featured: false, tag: "Business").order(created_at: :desc).limit(3)
        @sidebar_news = News.where(featured: false,  tag: "Business").where.not(id: @other_news.pluck(:id)).order(created_at: :desc).limit(2)
        exclude_ids = @other_news.pluck(:id) + @sidebar_news.pluck(:id)
        @more_news = News.where(featured: false, tag: "Business").where.not(id: exclude_ids).order(created_at: :desc)
    end

    def entertainment
        @main_featured = News.find_by(featured: true, tag: "Entertainment")
        @other_news = News.where(featured: false, tag: "Entertainment").order(created_at: :desc).limit(3)
        @sidebar_news = News.where(featured: false,  tag: "Entertainment").where.not(id: @other_news.pluck(:id)).order(created_at: :desc).limit(2)
        exclude_ids = @other_news.pluck(:id) + @sidebar_news.pluck(:id)
        @more_news = News.where(featured: false, tag: "Entertainment").where.not(id: exclude_ids).order(created_at: :desc)
    end

    def new
        @news = News.new
    end

    def edit
        @news = News.friendly.find(params[:id])
    end

    def show 
        @news = News.friendly.find(params[:id])
        @related = News.where(tag: @news.tag).where.not(id: @news.id).limit(6)
    end

    def create
        @news = News.new(news_params)
        if @news.save
            redirect_to news_index_path, notice: "News saved successfully"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        @news = News.find(params[:id])
        if @news.update(news_params)
            redirect_to news_path(@news), notice: "News updated successfully"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    private

    def news_params
        params.require(:news).permit!
    end
end
