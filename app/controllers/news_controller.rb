class NewsController < ApplicationController

  def site_information
    @many_news = News.where(news_type: 0).order(created_at: 'DESC')
  end

  def camera_information
    @many_news = News.where(news_type: 1).order(created_at: 'DESC')
  end

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

  def destroy
    @news = News.find(params[:id])
    @news.destroy
    redirect_to admin_news_index_path
  end

  private
  def news_params
    params.require(:news).permit(:title, :content, :news_type, :news_image)
  end

end
