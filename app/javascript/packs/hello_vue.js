import Vue from 'vue/dist/vue.min.js';
import axios from 'axios';


axios.defaults.headers.common = {
    'X-Requested-With': 'XMLHttpRequest',
    'X-CSRF-TOKEN' : document.querySelector('meta[name="csrf-token"]').getAttribute('content')
};

if( document.getElementsByClassName('prefecture-city')){
  var prefectureSelect = new Vue({
  el: '.prefecture-city',
  data: {
    selectedPref: '',
    cities: [], 
    prefectures: JSON.parse(gon.prefectures)
  },
  
  methods: {
    getCities: function(prefecture) {
      axios
        .post('/set_cities', {
          id: prefecture
        })
        .then((response) => {
          this.cities = response.data
        })
    }
  }
})
};

document.addEventListener('DOMContentLoaded', function(){
  var selection = document.getElementById('q_prefecture_id_eq')
  if(selection){
    var indexId = selection.selectedIndex
    var prefectureId = indexId + 1
    prefectureSelect.methods.getCities.function(prefectureId)

  //   new Vue({
  //   el: '.prefecture-city',
  //   data: {
  //     selectedPref: '',
  //     cities: [], 
  //     prefectures: JSON.parse(gon.prefectures)
  //   },
    
  //   methods: {
  //     getCities: function(prefectureId) {
  //       axios
  //         .post('/set_cities', {
  //           id: prefecture
  //         })
  //         .then((response) => {
  //           this.cities = response.data
  //         })
  //     }
  //   }
  // })
  }
});