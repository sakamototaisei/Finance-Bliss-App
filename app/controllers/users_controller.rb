class UsersController < ApplicationController
  def index
    @users = User.all.order(created_at: :desc)
    @genres = Genre.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
    @genres = Genre.all
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "プロフィールの内容を変更しました"
      redirect_to user_path(@user.id)
    else
      @user = User.find(params[:id])
      flash.now[:alert] = "正しく情報を入力してください"
      render :edit
    end
  end

  def likes
    @user = User.find(params[:id])
    @likes = Like.where(user_id: @user.id)
    @genres = Genre.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
