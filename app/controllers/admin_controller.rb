class AdminController < ApplicationController
  before_action :require_login
  before_action :current_user_is_admin?

  private

  def current_user_is_admin?
    unless current_user.admin
      redirect_to root_path
    end
  end
end
