class UsersController < ApplicationController

  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "プロフィールの内容を変更しました"
      redirect_to user_path(@user.id)
    else
      @user = User.find(params[:id])
      flash.now[:alert] = "名前を入力してください"
      render :edit
    end
  end

  def likes
    @user = User.find(params[:id])
    @likes = Like.where(user_id: @user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
