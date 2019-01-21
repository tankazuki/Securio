class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  	if @user.save
      sign_in_user @user
      #flash[:success] = "新規登録が成功しました"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    user = User.find(params[:id])
    user.enable = false
    user.save
    sign_out_user
    flash[:success] = "退会しました"
    redirect_to unsubscribe_user_path
  end

  def unsubscribe
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :mail, :password, :password_confirmation, :user_image_id)
  end
end
