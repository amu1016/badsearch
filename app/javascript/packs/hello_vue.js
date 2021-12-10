import Vue from 'vue/dist/vue.min.js';
import axios from 'axios';
import Sample from '../clubs/checkbox';


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






document.addEventListener('DOMContentLoaded', function(){
  var queryStringVue = window.location.search;
  var queryObjectVue = new Object();
  if(queryStringVue){
    queryStringVue = queryStringVue.substring(1);
    var decodeParametersVue = decodeURIComponent(queryStringVue);
    var parametersVue = decodeParametersVue.split('&');
    for (var i = 0; i < parametersVue.length; i++) {
      var elementVue = parametersVue[i].split('=');
      var paramNameVue = elementVue[0];
      var paramValueVue = elementVue[1];
      queryObjectVue[paramNameVue] = paramValueVue;

      if (paramNameVue === "q[prefecture_id_eq]") {
        var elementIdVue = paramNameVue.replace("[", "_");
        elementIdVue = elementIdVue.replace("]", "");
        var selectTargetsVue = document.getElementById(elementId);
        selectTargetsVue.options[paramValueVue - 1].selected = true;

        if( selectTargetsVue.addEventListener('change')){
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
    };
  };
};
});