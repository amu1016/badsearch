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
      redirect_to room_path(@room.id)
    else
      render :new
    end
  end

  def show
    
    @room = Room.find(params[:id])
    @the_other = User.find(room_partner_id)
    @messages_by_myself=Message.where(user_id: current_user.id,room_id: @room.id)
    @messages_by_the_other=Message.where(user_id: @the_other.id,room_id: @room.id)
    @messages = @messages_by_myself.or(@messages_by_the_other)
    @messages = @messages.order(:created_at)
  end


  private

  def room_partner_id
    @room.user_ids.each do |id|
      if id != current_user.id
        return id
      end
    end
  end

end
