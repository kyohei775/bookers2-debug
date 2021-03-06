class RelationshipsController < ApplicationController
  def create
  current_user.follow(params[:id])
  redirect_to users_path
  end

  def destroy
  current_user.unfollow(params[:id])
  redirect_to users_path
  end

end
