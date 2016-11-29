class UsersController < Clearance::UsersController
  private

  def user_params
    if params[:user]
      params.require(:user).permit(:email, :password, :password_confirmation)
    else
      Hash.new
    end
  end
end
