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

end
