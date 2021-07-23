class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = "新規投稿しました"
      redirect_to posts_path
    else
      @post = Post.new
      flash.now[:alert] = "正しく投稿内容の記述をしてください"
      render :new
    end
  end

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user.id != current_user.id
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "投稿内容を変更しました"
      redirect_to post_path(@post.id)
    else
      @post = Post.find(params[:id])
      flash.now[:alert] = "正しく投稿内容の記述をしてください"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:introduction, :image)
  end

end
