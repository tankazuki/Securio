class AdminsController < ApplicationController

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