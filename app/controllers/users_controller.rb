class UsersController < ApplicationController
  def show
  	@user =User.find(params[:id])
  	# 1件ユーザーidを取得
  	@post_images = @user.post_images.page(params[:page]).reverse_order
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user =User.find(params[:id])
  	# 省略文
  	@user.update(user_params)
  	redirect_to user_path(@user.id)
  end

  private
  def user_params
  	params.require(:user).permit(:name, :profile_image)
end
