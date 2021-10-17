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
    user = User.find_by(name: "ゲスト")
    if user.name == "ゲスト"
      redirect_to user_path(current_user)
    end
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

  # ゲストログイン
  def new_guest
    # emailでユーザーが見つからなければ作ってくれるという便利なメソッド
    user = User.find_or_create_by(email: 'guest@example.com') do |user|
    # 自分はユーザー登録時にニックネームを必須にしているのでこの記述が必要
    user.name = "ゲスト"
    # 英数字混合を必須にしているので、ランダムパスワードに、英字と数字を追加してバリデーションに引っかからないようにしています。
    user.password = SecureRandom.alphanumeric(10) + [*'a'..'z'].sample(1).join + [*'0'..'9'].sample(1).join
    end
    # sign_inはログイン状態にするデバイスのメソッド
    sign_in user
    # ログイン後root_pathに飛ぶようにしました。
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
