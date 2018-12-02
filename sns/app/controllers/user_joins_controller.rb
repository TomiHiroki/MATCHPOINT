class UserJoinsController < ApplicationController
  def create
      @post = Post.find(params[:post_id])
      if current_user.join(@post)
        flash[:success] = "立候補しました"
        redirect_to message_user_path(@post.user)
      else
        flash[:danger] = "立候補に失敗しました"
        redirect_to :back
      end

    end

    def destroy
      @post = Post.find(params[:post_id])
      if current_user.unjoin(@post)
        flash[:success] = "立候補を解除しました"
        redirect_to :back
      end
    end
end
