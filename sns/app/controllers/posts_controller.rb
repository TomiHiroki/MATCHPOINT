class PostsController < ApplicationController
  before_action :require_login

  def index
    @posts = Post.searching(params[:key_word])


  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿できました"
      redirect_to posts_path
    else
      flash.now[:danger] = "投稿失敗しました"
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private
  def post_params
    params.require(:post).permit(:content, :img, :title)
  end
end
