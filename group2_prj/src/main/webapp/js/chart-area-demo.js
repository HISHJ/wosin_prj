// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Area Chart Example
var ctx = document.getElementById("myAreaChart");
var dateArr = [];
var saleArr = [];
for(var i=1;i<6;i++){
	dateArr.push(document.getElementById("date_"+i).value);
	saleArr.push(document.getElementById("sale_"+i).value);
}
//var date1 = document.getElementById("date_1").value;
//var date2 = document.getElementById("date_2").value;
//var date3 = document.getElementById("date_3").value;
//var date4 = document.getElementById("date_4").value;
//var date5 = document.getElementById("date_5").value;
//var sale1 = document.getElementById("date_1Sale").value;
//var sale2 = document.getElementById("date_2Sale").value;
//var sale3 = document.getElementById("date_3Sale").value;
//var sale4 = document.getElementById("date_4Sale").value;
//var sale5 = document.getElementById("date_5Sale").value;

var myLineChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: [dateArr[4], dateArr[3], dateArr[2], dateArr[1], dateArr[0]],
//    labels: [date5, date4, date3, date2, dateArr[1]],
    datasets: [{
      label: "Sales",
      lineTension: 0.3,
      backgroundColor: "rgba(2,117,216,0.0)",
      borderColor: "#030066",
      pointRadius: 5,
      pointBackgroundColor: "#030066",
      pointBorderColor: "#030066",
      pointHoverRadius: 5,
      pointHoverBackgroundColor: "#030066",
      pointHitRadius: 50,
      pointBorderWidth: 2,
      data: [saleArr[4], saleArr[3], saleArr[2], saleArr[1], saleArr[0]],
    }],
  },
  options: {
    scales: {
      xAxes: [{
        time: {
          unit: 'date'
        },
        gridLines: {
          display: false
        },
        ticks: {
          maxTicksLimit: 7
        }
      }],
      yAxes: [{
        ticks: {
          min: 0,
          max: 2000000,
          maxTicksLimit: 5
        },
        gridLines: {
          color: "rgba(0, 0, 0, .125)",
        }
      }],
    },
    legend: {
      display: false
    }
  }
});
