class CommentsController < ApplicationController
 def create
   @post = Post.find_by(id: params[:post_id])
   @comment = @post.comments.build(comment_params)
   if @comment.save
     flash[:success] = "コメントを作成しました"
     redirect_to :back
   else
     flash.now[:danger] = "コメントの作成に失敗しました"
     redirect_to :back
   end
 end

 def destroy
   @comment = Comment.find(params[:id])
   @comment.destroy
   flash[:success] = 'コメントを削除しました。'
   redirect_back(fallback_location: root_path)

 end


  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
