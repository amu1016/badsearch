class RoomsController < ApplicationController
  
  def index
  end

  def new
    @room = Room.new
    @club = Club.find(params[:club_id])
  end

  def create
    @club = Club.find(params[:club_id])
    @room = Room.new(name: @club.name, user_ids:[current_user.id, @club.user_id])
    if @room.save
      redirect_to rooms_path
    else
      render :new
    end
  end


  private
  def room_params
    params.require(:club).permit(:user_id)
  end

end
