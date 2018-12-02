class UserFollowsController < ApplicationController
 def create
     @user = User.find(params[:user_id])
     if current_user.follow(@user)
       flash[:success] = "フォローしました"
       redirect_to :back
     else
       flash[:danger] = "フォローに失敗しました"
       redirect_to :back
     end

   end

   def destroy
     @user = User.find(params[:user_id])
     if current_user.unfollow(@user)
       flash[:success] = "フォロー解除しました"
       redirect_to :back
     end
   end
end
