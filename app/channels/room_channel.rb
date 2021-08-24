class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
    stream_for current_user.id
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    if data["message"]
    Message.create!(
      user_id: data["current_user_id"].to_i,
      room_id: data["room_id"].to_i,
      content: data['message']
    )

    RoomChannel.broadcast_to data["current_user_id"].to_i,
      content: data["message"],
      the_other_id: data["the_other_id"],
      isCurrent_user: true


    RoomChannel.broadcast_to data["the_other_id"].to_i,
      content: data["message"],
      the_other_id: data["the_other_id"],
      isCurrent_user: false
    end
  end
end
