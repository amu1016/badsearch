import Vue from 'vue/dist/vue.esm';

new Vue({
  el: '#example_form',
  data: {
    prefectures: JSON.parse(gon.prefectures)
  }
});