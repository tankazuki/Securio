class NewsController < ApplicationController

  def new
    @news = News.new
  end

  def create
    @news = News.new(news_params)
    if @news.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def news_params
    params.require(:news).permit(:title, :content, :news_type, :news_image)
  end

end
