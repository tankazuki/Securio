class AdminsController < ApplicationController
  before_action :authenticate_admin!

  def camera_index
    @cameras = Camera.all
  end

  def user_index
    @users = User.where(enable: true)
  end

  def news_index
    @many_news = News.all
  end

  def manufacturer_index
    @manufacturers = Manufacturer.all
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      #sign_in_admin @admin
      #flash[:success] = "新規登録が成功しました"
      redirect_to root_path
     else
      render 'new'
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:mail, :password, :password_confirmation)
  end

end
