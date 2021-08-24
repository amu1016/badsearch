import consumer from "./consumer"

const chatChannel = consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },
  disconnected() {
    // Called when the subscription has been terminated by the server
  },
  received: function(data) {
    //画面を開いているのがチャット送信者だった場合
    if (data["isCurrent_user"]==true){
      var content=`<div class='mycomment'><p>${data["content"]}</p></div>`;
    }
    //画面を開いているのがチャット受信者だった場合
    else{
      var content=`<div class='fukidasi'>
      <div class='chatting'><div class='says'><p>${data["content"]}</p>
      </div></div></div>`;
    }
    $('#chats').append(content);
  },
  speak: function(message) {
    var currentUserId = $("#current_user_id").val();
    var roomId = $("#room_id").val();
    var theOtherId = $("#the_other_id").val();
    return this.perform('speak',{
      message: message, current_user_id: currentUserId, room_id: roomId, the_other_id: theOtherId
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