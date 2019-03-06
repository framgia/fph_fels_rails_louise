class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    respond_to do |format|
      format.html { redirect_to request.referrer }
      format.js
    end
    
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    relationship = Relationship.find_by(follower_id:current_user.id,followed_id:@user.id)
    Activity.find_by(action: relationship).destroy
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to request.referrer }
      format.js
    end
  end

end
