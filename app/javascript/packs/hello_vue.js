import Vue from 'vue/dist/vue.esm';
import axios from 'axios';

axios.defaults.headers.common = {
    'X-Requested-With': 'XMLHttpRequest',
    'X-CSRF-TOKEN' : document.querySelector('meta[name="csrf-token"]').getAttribute('content')
};


if( document.getElementsByClassName('prefecture-city')){
  new Vue({
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