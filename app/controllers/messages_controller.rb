class MessagesController < ApplicationController

  def index
  end

  def create
    @room = Room.find(params[:room_id])
    @message = Message.new(content: params[:content], user_id: current_user.id, room_id: params[:room_id])
    @message.save
    MessageChannel.broadcast_to @room, message: @message
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id, room_id: @room.id)
  end


end
