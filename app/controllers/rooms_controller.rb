class RoomsController < ApplicationController
  
  def index
    @room = Room.find(params[:format])
  end

  def new
    @room = Room.new
    @club = Club.find(params[:club_id])
  end

  def create
    @club = Club.find(params[:club_id])
    @room = Room.new(name: @club.name, user_ids:[current_user.id, @club.user_id])
    if @room.save
      redirect_to rooms_path(@room.id)
    else
      render :new
    end
  end


  private
  def room_params
    params.require(:room)
  end

end
