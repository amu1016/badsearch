import consumer from "./consumer"

const chatChannel = consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },
  disconnected() {
    // Called when the subscription has been terminated by the server
  },
  received: function(data) {
    return alert(data['message']);
    //画面を開いているのがチャット送信者だった場合
    if (data["isCurrent_user"]==true){
      content=`<div class='mycomment'><p>${data["content"]}</p></div>`;
    }
    //画面を開いているのがチャット受信者だった場合
    else{
      content=`<div class='fukidasi'>
      <div class='chatting'><div class='says'><p>${data["content"]}</p>
      </div></div></div>`;
    }
    $('#chats').append(content);
  },
  speak: function(message) {
    current_user_id=$("#current_user_id").value;
    room_id=$("#room_id").value;
    return this.perform('speak',{
      message: message, current_user_id: current_user_id, room_id: room_id
    });
  }
});

$(document).on('keypress', '[data-behavior~=room_speaker]', function(event) {
  if (event.keyCode === 13) {
    chatChannel.speak(event.target.value);
    event.target.value = '';
    return event.preventDefault();
  }
});