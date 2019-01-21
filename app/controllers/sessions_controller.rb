class SessionsController < ApplicationController

  def admin_new
    @admin = Admin.new
  end

  def admin_create
    admin = Admin.find_by(mail: params[:session][:mail].downcase)
    if admin && admin.authenticate(params[:session][:password])
      sign_in_admin admin
      flash[:success] = "ログインしました"
      redirect_to root_path
    else
      flash[:danger] = "入力内容をもう一度確認ください"
      render 'admin_new'
    end
  end

  def admin_destroy
    sign_out_admin
    flash[:success] = "ログアウトしました"
    redirect_to root_url
  end

  def user_new
		@user = User.new
	end

  def user_create
	user = User.find_by(mail: params[:session][:mail].downcase)
 		if user && user.authenticate(params[:session][:password])
  			if user.enable == true
      		 sign_in_user user
				flash.now[:success] = "ログインしました"
      		 redirect_to root_url
  			else
  				flash.now[:danger] = "すでに退会済みユーザーです"
  				render 'User_new'
  			end
  		else
  			flash.now[:danger] = "入力内容の確認をお願いします"
  			render 'User_new'
  		end
	end

  def user_destroy
    sign_out_user
    flash[:success] = "ログアウトしました"
    redirect_to root_url
  end

end
