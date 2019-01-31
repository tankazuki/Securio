class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  	if @user.save
      sign_in_user @user
      flash[:success] = "新規登録が成功しました"
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
    if sign_in_admin?
      flash[:success] = "ユーザの退会処理が完了しました"
      redirect_to admin_user_index_path
    else
      flash[:success] = "退会しました"
      redirect_to unsubscribe_user_path
    end
  end

  def unsubscribe
  end

  def access_histories
    sql = "
    SELECT cameras.id, cameras.camera_name, cameras.resolution, cameras.weight, cameras.camera_type, cameras.manufacturer_id, cameras.created_at, impressions.created_at
    FROM cameras
    INNER JOIN impressions
    ON cameras.id = impressions.impressionable_id
    WHERE impressions.user_id = #{current_user.id}
    ORDER BY impressions.created_at DESC;
    "
    result = ActiveRecord::Base.connection.execute(sql)
    @histories = result.to_a
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :mail, :password, :password_confirmation, :user_image_id)
  end
end
