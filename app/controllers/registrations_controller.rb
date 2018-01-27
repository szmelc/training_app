class RegistrationsController < Devise::RegistrationsController
  def update
    @user = User.find(current_user.id)

    if @user.update_without_password(user_params)
      sign_in @user, :bypass => true
      redirect_to user_path(@user)
    else
      render "edit"
    end
  end

  private

  def is_google_account?
    @user.provider == 'google_oauth2'
  end

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :bio,
      :title,
      :website,
      :avatar,
      :avatar_cache,
      )
  end
end
