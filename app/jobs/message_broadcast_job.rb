class MessageBroadcastJob < ApplicationJob
  def perform(message)
    ActionCable.server.broadcast 'room_channel', message: render_message(message)
    
    #画面を開いているのがチャット送信者だった場合
    MessageChannel.broadcast_to data["current_user_id"].to_i,
    content: data["message"],
    the_other_id: data["the_other_id"],
    isCurrent_user: true

    #画面を開いているのがチャット受信者だった場合
    MessageChannel.broadcast_to data["the_other_id"].to_i,
    content: data["message"],
    the_other_id: data["the_other_id"],
    isCurrent_user: false
  end

  private

  def render_message(message)
    ApplicationController.renderer.render partial: 'messages/message', locals: { message: message }
  end
end
