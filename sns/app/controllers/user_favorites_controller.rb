class UserFavoritesController < ApplicationController
 def create
     @post = Post.find(params[:post_id])
     if current_user.favorite(@post)
       flash[:success] = "お気に入りしました"
       redirect_to :back
     else
       flash[:danger] = "お気に入りに失敗しました"
       redirect_to :back
     end

   end

   def destroy
     @post = Post.find(params[:post_id])
     if current_user.unfavorite(@post)
       flash[:success] = "お気に入りを解除しました"
       redirect_to :back
     end
   end
end
