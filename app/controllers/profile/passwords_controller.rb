module Profile
  class PasswordsController < ApplicationController
    def update
      user = current_user
      old_password = params.dig(:user, :old_password)
      correct_password = user.authenticated?(old_password)
      if correct_password && user.update(user_params)
        flash[:success] = 'Password changed'
      else
        flash[:warning] = 'Invalid password'
      end
      redirect_to profile_path
    end

    private

    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end
  end
end
