module SessionsHelper

  def sign_in_admin(admin)
    session[:admin_id] = admin.id
  end

  def current_admin
    if session[:admin_id]
      @current_admin ||= Admin.find_by(id: session[:admin_id])
    end
  end

  def sign_out_admin
    session.delete(:admin_id)
    @current_admin = nil
  end

  def sign_in_admin?
    !current_admin.nil?
  end

  def sign_in_user(user)
		session[:user_id] = user.id
	end

  def sign_out_user
		session.delete(:user_id)
		@current_user = nil
	end

  def current_user
		if session[:user_id]
			@current_user ||= User.find_by(id: session[:user_id])
		end
	end

  def sign_in_user?
		!current_user.nil?
	end

  def authenticate_user!
		unless sign_in_user?
			flash[:danger] = 'ログインしてください'
			redirect_to sign_in_user_path
		end
	end

	def authenticate_admin!
		unless sign_in_admin?
			flash[:danger] = '権限がありません'
			redirect_to root_path
		end
	end

  def user_sign_check
		if sign_in_user?
			redirect_to root_path
		end
	end

	def admin_sign_check
		if sign_in_admin?
			redirect_to root_path
		end
	end

end
