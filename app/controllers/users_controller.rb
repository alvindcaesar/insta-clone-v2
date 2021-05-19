class UsersController < ApplicationController

  def show
    @posts = Current.user.posts.order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  Current.user.update(user_params)
  redirect_to edit_user_path, notice: "Profile info updated."
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :website, :bio, :email, :phone, :avatar)
  end

end
