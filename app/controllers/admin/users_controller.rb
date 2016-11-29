module Admin
  class UsersController < AdminController
    def index
      @users = User.all.paginate(page: params[:page])
    end

    def show
      @user = User.find(params[:id])
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to admin_user_path(@user)
      else
        render :new
      end
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      params[:user].delete(:password) if params[:user][:password].blank?
      if @user.update(user_params)
        redirect_to admin_user_path(@user)
      else
        render :edit
      end
    end

    private

    def user_params
      params.require(:user).permit(:email,
                                   :password,
                                   :admin,
                                   :password_confirmation)
    end
  end
end
