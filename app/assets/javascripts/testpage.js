var TrackEvent = function(x, val){
  var _tm_event = {
    name: x,
    value: val
  }

  var _tm_request = $.ajax({
    url: "http://localhost:3000/events",
    method: "post",
    data: {
      token: "af0543dff939f056",
      event: _tm_event
    }
  })
}

$(document).ready(function(){
  $("a.tracked").click(function(){
    alert("test");
    TrackEvent("link-click");
  })
})