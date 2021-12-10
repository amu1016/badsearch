document.addEventListener('DOMContentLoaded', function(){
  var queryString = window.location.search;
  var queryObject = new Object();
  if(queryString){
    queryString = queryString.substring(1);
    var replacedQueryString = queryString.replace("q%5B", "").replace("%5D", "").replace("%5D%5B%5D", "").replace("%E4%BB%A3", "")
    var parameters = replacedQueryString.split('&');
    for (var i = 0; i < parameters.length; i++) {
      var elementId = parameters[i].replace("=", "_");
      if(document.getElementById(elementId)){
        var checkTargets = document.getElementById(elementId)
        checkTargets.checked = true;
      };
    };
  };
});



