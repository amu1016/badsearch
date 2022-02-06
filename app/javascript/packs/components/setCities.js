import Vue from 'vue/dist/vue.min.js';
import axios from 'axios';


axios.defaults.headers.common = {
    'X-Requested-With': 'XMLHttpRequest',
    'X-CSRF-TOKEN' : document.querySelector('meta[name="csrf-token"]').getAttribute('content')
};

// if( document.getElementsByClassName('prefecture-city')){
//   new Vue({
//     el: '.prefecture-city',
//     data: {
//       selectedPref: '',
//       cities: [], 
//       prefectures: JSON.parse(gon.prefectures)
//     },
    
//     methods: {
//       getCities: function(prefecture) {
//         axios
//           .post('/set_cities', {
//             id: prefecture
//           })
//           .then((response) => {
//             this.cities = response.data
//           })
//       }
//     }
//   })
// }



document.addEventListener('DOMContentLoaded', function(){
  if( document.getElementsByClassName('prefecture-city')){
    var vm =new Vue({
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
            .then(function(){
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
                  if (paramNameVue === "q[city_id_eq_any][]") {
                    var cityList = document.getElementsByClassName('city-list')
                    for (var j = 0; j < cityList.length; j++){
                      var checkTargetsVue = cityList[j].firstElementChild
                      if (checkTargetsVue.value === `${paramValueVue}`) {
                        checkTargetsVue.checked = true;
                        break;
                      };
                    };
                  };
                };
              };
            })
        }
      }
    })
  }
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
        var selectTargetsVue = document.getElementById(elementIdVue);
        selectTargetsVue.options[paramValueVue - 1].selected = true;
        vm.selectedPref = paramValueVue;
        vm.getCities(paramValueVue);
        // var x = await vm.getCities(paramValueVue);
        // console.log(x);
      };
    };
  }
})

// if( document.getElementsByClassName('prefecture-city')){
//   var selection = document.getElementById('q_prefecture_id_eq')
//   var indexId = selection.selectedIndex
//   var prefectureId = indexId + 1
//   var prefId = { id: prefectureId }
//   new Vue({
//     el: '.prefecture-city',
//     data: {
//       selectedPref: prefId,
//       cities: [], 
//       prefectures: JSON.parse(gon.prefectures)
//     },
    
//     methods: {
//       getCities: function(prefecture) {
//         axios
//           .post('/set_cities', {
//             id: prefecture
//           })
//           .then((response) => {
//             this.cities = response.data
//           })
//       }
//     }
//   })
//   // if(selection.selected){
//   //   var indexId = selection.selectedIndex
//   //   var prefectureId = indexId + 1
//   //   var prefId = { id: prefectureId }
//   //   new Vue({
//   //     el: '.prefecture-city',
//   //     data: {
//   //       selectedPref: `${prefId}`,
//   //       cities: [], 
//   //       prefectures: JSON.parse(gon.prefectures)
//   //     },
      
//   //     methods: {
//   //       getCities: function(prefecture) {
//   //         axios
//   //           .post('/set_cities', {
//   //             id: prefecture
//   //           })
//   //           .then((response) => {
//   //             this.cities = response.data
//   //           })
//   //       }
//   //     }
//   //   })
//   // }else{
//   //   new Vue({
//   //     el: '.prefecture-city',
//   //     data: {
//   //       selectedPref: '',
//   //       cities: [], 
//   //       prefectures: JSON.parse(gon.prefectures)
//   //     },
      
//   //     methods: {
//   //       getCities: function(prefecture) {
//   //         axios
//   //           .post('/set_cities', {
//   //             id: prefecture
//   //           })
//   //           .then((response) => {
//   //             this.cities = response.data
//   //           })
//   //       }
//   //     }
//   //   })
//   // }
// };
