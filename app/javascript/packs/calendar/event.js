import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';
import { event } from 'jquery';

//events#index用
document.addEventListener('DOMContentLoaded', function() {
  if ( document.getElementById('calendar')){
  var calendarEl = document.getElementById('calendar');

  var calendar = new Calendar(calendarEl, {
    plugins: [ dayGridPlugin, interactionPlugin ],
    locale: 'ja',
    timeZone: 'local',
    firstDay: 1,
    headerToolbar: {
      start: 'prev',
      center: 'title',
      end: 'next' 
    },
    expandRows: true,
    stickyHeaderDates: true,
    buttonText: {
      today: '今日'
    }, 
    allDayText: '終日',
    slotMinutes: 30,
    eventTimeFormat: { hour: 'numeric', minute: '2-digit' },
    height: "auto",
    editable: true,
    events: `${location.pathname}.json`,
    

    dateClick: function(info){
      //クリックした日付の情報を取得
      const year  = info.date.getFullYear();
      const month = (info.date.getMonth() + 1);
      const day   = info.date.getDate();

      //ajaxでevents/newを着火させ、htmlを受け取ります
      $.ajax({
          type: 'GET',
          url:  `${location.pathname}/new`,
      }).done(function (res) {
          // 成功処理
          // 受け取ったhtmlをさっき追加したmodalのbodyの中に挿入します
          $('.modal-body').html(res);

          //フォームの年、月、日を自動入力
          $('#event_start_1i').val(year);
          $('#event_start_2i').val(month);
          $('#event_start_3i').val(day);

          $('#event_end_1i').val(year);
          $('#event_end_2i').val(month);
          $('#event_end_3i').val(day);

          //ここのidはevents/newのurlにアクセスするとhtmlがコードとして表示されるので、
          //開始時間と終了時間のフォームを表しているところのidを確認してもらうことが確実です

          $('#modal').fadeIn();

      }).fail(function (result) {
          // 失敗処理
          alert("failed");
      });
    },


    eventClick: function(info){
      var eventObj = info.event;
      var eventId = Number(eventObj.id);
        //クリックした日付の情報を取得

      //ajaxでevents/newを着火させ、htmlを受け取ります
      $.ajax({
          type: 'GET',
          url:  `${location.pathname}/${eventId}/edit`,
      }).done(function (res) {
          // 成功処理
          // 受け取ったhtmlをさっき追加したmodalのbodyの中に挿入します
          $('.modal-body').html(res);

          //フォームの年、月、日を自動入力
          $('#event_start_1i').val(eventObj.start.getFullYear());
          $('#event_start_2i').val(eventObj.start.getMonth() + 1);
          $('#event_start_3i').val(eventObj.start.getDate());

          $('#event_end_1i').val(eventObj.end.getFullYear());
          $('#event_end_2i').val(eventObj.end.getMonth() + 1);
          $('#event_end_3i').val(eventObj.end.getDate());

          //ここのidはevents/newのurlにアクセスするとhtmlがコードとして表示されるので、
          //開始時間と終了時間のフォームを表しているところのidを確認してもらうことが確実です

          $('#modal').fadeIn();

      }).fail(function (result) {
          // 失敗処理
          alert("failed");
      });
    },
  });

  calendar.render();

  $(".error").click(function(){
    calendar.refetchEvents();
});
};


// clubs#show用
if ( document.getElementById('club-calendar')){
  var calendarEl = document.getElementById('club-calendar');

  var calendar = new Calendar(calendarEl, {
    plugins: [ dayGridPlugin, interactionPlugin ],
    locale: 'ja',
    timeZone: 'local',
    firstDay: 1,
    headerToolbar: {
      start: 'prev',
      center: 'title',
      end: 'next' 
    },
    expandRows: true,
    stickyHeaderDates: true,
    buttonText: {
      today: '今日'
    }, 
    allDayText: '終日',
    eventTimeFormat: { hour: 'numeric', minute: '2-digit' },
    height: "auto",
    editable: true,
    events: `${location.pathname}/events.json`,
    

    eventClick: function(info){
      var eventObj = info.event;
      var eventId = Number(eventObj.id);
      $.ajax({
          type: 'GET',
          url:  `${location.pathname}/events/${eventId}`,
      }).done(function (res) {
          // 成功処理
          // 受け取ったhtmlをさっき追加したmodalのbodyの中に挿入します
          $('.modal-body').html(res);

          $('#modal').fadeIn();

      }).fail(function (result) {
          alert("failed");
      });
    },
  });

  calendar.render();

  $(".error").click(function(){
    calendar.refetchEvents();
});
};
});
