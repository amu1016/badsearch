window.addEventListener('DOMContentLoaded', function(){
  var queryString = window.location.search;
  var queryObject = new Object();
  if(queryString){
    queryString = queryString.substring(1);
    var parameters = queryString.split('&');
    var decodeParameters = decodeURIComponent(parameters);
    for (var i = 0; i < decodeParameters.length; i++) {
      var element = decodeParameters[i].split('=');
      var paramName = element[0];
      var paramValue = element[1];
      queryObject[paramName] = paramValue;

      // チェックボックス保持
      if (paramName === "q[status_id_eq_any][]") {
        var elementId = decodeParameters[i].replace("[", "");
        elementId = elementId.replace("][]=", "_");
        var checkTargets = document.getElementById(elementId);
        checkTargets.checked = true;
      };
      if (paramName === "q[want_sex_id_eq_any][]") {
        var elementId = decodeParameters[i].replace("=", "_");
        elementId = elementId.replace("][]=", "_");
        var checkTargets = document.getElementById(elementId);
        checkTargets.checked = true;
      };
      if (paramName === "q[want_ages_name_eq_any][]") {
        var elementId = decodeParameters[i].replace("=", "_");
        elementId = elementId.replace("][]=", "_");
        var checkTargets = document.getElementById(elementId);
        checkTargets.checked = true;
      };
      if (paramName === "q[want_levels_name_eq_any][]") {
        var elementId = decodeParameters[i].replace("=", "_");
        elementId = elementId.replace("][]=", "_");
        var checkTargets = document.getElementById(elementId);
        checkTargets.checked = true;
      };
    };
  };
});



