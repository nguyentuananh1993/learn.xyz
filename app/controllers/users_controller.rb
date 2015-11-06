class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        if !@is_me
            @status = current_user.status_with @user.id
            @friend =   Friend.where(user_id: current_user.id, friend_id: @user.id).try(:first) ||
                        Friend.where(user_id: @user.id, friend_id: current_user.id).try(:first)
        end
    end
    
    def friends
        Friend.where("user_id = ? or friend_id = ?", self.id, self.id)
    end
end