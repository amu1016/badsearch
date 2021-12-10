import axios from 'axios';

axios.defaults.headers.common = {
  'X-Requested-With': 'XMLHttpRequest',
  'X-CSRF-TOKEN' : document.querySelector('meta[name="csrf-token"]').getAttribute('content')
};

document.addEventListener('DOMContentLoaded', function(){
  var queryString = window.location.search;
  var queryObject = new Object();
  if(queryString){
    queryString = queryString.substring(1);
    var decodeParameters = decodeURIComponent(queryString);
    var parameters = decodeParameters.split('&');
    for (var i = 0; i < parameters.length; i++) {
      var element = parameters[i].split('=');
      var paramName = element[0];
      var paramValue = element[1];
      queryObject[paramName] = paramValue;

      // 都道府県
      // if (paramName === "q[prefecture_id_eq]") {
      //   var elementId = paramName.replace("[", "_");
      //   elementId = elementId.replace("]", "");
      //   var selectTargets = document.getElementById(elementId);
      //   selectTargets.options[paramValue - 1].selected = true;
      //   // selectTargets.addEventListener('change', Sample.default.methods.getCities());
      //   // axios
      //   //   .post('/set_cities', {
      //   //     id: paramValue
      //   //   })
      //   //   .then((response) => {
      //   //     var cities = response.data
      //   //   })
      // };

      // 市区町村
      if (paramName === "q[city_id_eq_any][]") {
        var elementId = parameters[i].replace("[", "_");
        elementId = elementId.replace("][]=", "_");
        var checkTargets = document.getElementById(elementId);
        for (var j = 0; j < checkTargets.length; j++){
          if (checkTargets[j].value === paramValue) {
            checkTargets[j].checked = true;
            break;
          };
        };
      };

      // チェックボックス保持
      if (paramName === "q[status_id_eq_any][]") {
        var elementId = parameters[i].replace("[", "_");
        elementId = elementId.replace("][]=", "_");
        var checkTargets = document.getElementById(elementId);
        checkTargets.checked = true;
      };
      if (paramName === "q[want_sex_id_eq_any][]") {
        var elementId = parameters[i].replace("[", "_");
        elementId = elementId.replace("][]=", "_");
        var checkTargets = document.getElementById(elementId);
        checkTargets.checked = true;
      };
      if (paramName === "q[want_ages_name_eq_any][]") {
        var elementId = parameters[i].replace("[", "_");
        elementId = elementId.replace("][]=", "_");
        var checkTargets = document.getElementById(elementId);
        checkTargets.checked = true;
      };
      if (paramName === "q[want_levels_name_eq_any][]") {
        var elementId = parameters[i].replace("[", "_");
        elementId = elementId.replace("][]=L", "_l");
        var checkTargets = document.getElementById(elementId);
        checkTargets.checked = true;
      };
    };
  };
});

