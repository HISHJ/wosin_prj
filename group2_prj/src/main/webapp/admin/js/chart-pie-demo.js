// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Pie Chart Example
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
  type: 'pie',
  data: {
    labels: ["공연1", "공연2", "공연3", "공연4","공연5"],
    datasets: [{
      data: [11, 15.58, 11.25, 8.32, 4.2],
      backgroundColor: ['#030066', '#dc3545', '#ffc107', '#198754', '#adb5bd'],
      
    }],
  },
});
