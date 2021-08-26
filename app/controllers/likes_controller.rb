class LikesController < ApplicationController
  def create
    @club = Club.find(params[:club_id])
    current_user.like(@club)
  end

  def destroy
    @club = Like.find(params[:id]).club
    current_user.unlike(@club)
  end
end
