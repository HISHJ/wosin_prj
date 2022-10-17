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

var showCnt = document.getElementsByName("shows");
//alert("showCnt : "+showCnt.length);
var cntCnt = document.getElementsByName("cnt");
//alert("cntCnt : "+cntCnt.length);

var showArr = [];
var cntArr = [];
//alert(document.getElementById("show_1").value);
for(var i=1;i<showCnt.length+1;i++){
	showArr.push(document.getElementById("show_"+i).value);
	cntArr.push(document.getElementById("cnt_"+i).value);
}
//alert("showArr : "+showArr.length);
var showStr = "";
var cntStr = "";
for(var i=0;i<showArr.length;i++){
	showStr += showArr[i];
	cntStr += cntArr[i];
	if(i<showArr.length-1){ // 공연하나 추가해서 예매되면 다시 테스트해보기
		showStr += ",";
		cntStr += ",";
	}
} 
//alert("showStr : "+showStr);
//alert("cntStr : "+cntStr);
var myPieChart = new Chart(ctx, {
  type: 'pie',
  data: {
//    labels: [show1, show2, show3, show4,show5],
    //labels: [showArr[0], showArr[1], showArr[2], showArr[3],showArr[4]],
    labels: [showStr],
    datasets: [{
//      data: [cnt1, cnt2, cnt3, cnt4, cnt5],
      //data: [cntArr[0], cntArr[1], cntArr[2], cntArr[3], cntArr[4]],
      data: [cntStr],
      backgroundColor: ['#030066', '#dc3545', '#ffc107', '#198754', '#adb5bd'], // 색은 별도처리없어도 잘 되나?
      
    }],
  },
});

