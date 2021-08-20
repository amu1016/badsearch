class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create!(
      user_id: data["current_user_id"].to_i,
      room_id: data["room_id"].to_i,
      content: data['message']
    )
  end
end
