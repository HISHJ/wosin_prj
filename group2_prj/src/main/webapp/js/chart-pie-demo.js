// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';
// Pie Chart Example
var ctx = document.getElementById("myPieChart");
//var firstShow = document.getElementById("test1011").value;
//var firstShowCnt = document.getElementById("firstShowCnt");
//var test1 = sessionStorage.getItem("test");

//var show1 = document.getElementById("show_1").value;
//var show2 = document.getElementById("show_2").value;
//var show3 = document.getElementById("show_3").value;
//var show4 = document.getElementById("show_4").value;
//var show5 = document.getElementById("show_5").value;
//var cnt1 = document.getElementById("show_1Cnt").value;
//var cnt2 = document.getElementById("show_2Cnt").value;
//var cnt3 = document.getElementById("show_3Cnt").value;
//var cnt4 = document.getElementById("show_4Cnt").value;
//var cnt5 = document.getElementById("show_5Cnt").value;



var showArr = [];
var cntArr = [];
for(var i=1;i<6;i++){
	showArr.push(document.getElementById("show_"+i).value);
	cntArr.push(document.getElementById("cnt_"+i).value);
}

var myPieChart = new Chart(ctx, {
  type: 'pie',
  data: {
//    labels: [show1, show2, show3, show4,show5],
    labels: [showArr[0], showArr[1], showArr[2], showArr[3],showArr[4]],
    datasets: [{
//      data: [cnt1, cnt2, cnt3, cnt4, cnt5],
      data: [cntArr[0], cntArr[1], cntArr[2], cntArr[3], cntArr[4]],
      backgroundColor: ['#030066', '#dc3545', '#ffc107', '#198754', '#adb5bd'],
      
    }],
  },
});

