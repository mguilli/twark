// $(document).ready(function(){
//   var x = $('#event-type').data('event');
//   console.log(x)
// });

var GenerateChart = function(key, labelarray, valuearray){
    var ctx = document.getElementById(key).getContext("2d");

    var data = {
        labels: labelarray,
        datasets: [{
          label: "My First dataset",
          fillColor: "rgba(220,220,220,0.2)",
          strokeColor: "rgba(69,158,197,1)",
          pointColor: "rgba(220,220,220,1)",
          pointStrokeColor: "#fff",
          pointHighlightFill: "#fff",
          pointHighlightStroke: "rgba(220,220,220,1)",
          data: valuearray
        }]
    };

    var myLineChart = new Chart(ctx).Line(data, {pointHitDetectionRadius : 0});
}