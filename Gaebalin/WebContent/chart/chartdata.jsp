<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>월간 판매량</title>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery.min.js"></script>
    <!-- google charts -->
       <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  </head>
  <body>
 <jsp:include page="/common/top.jsp"></jsp:include>
 	<div class="container">
    <h1>월간 판매량</h1>
    <div id="Line_Controls_Chart">
      <!-- 라인 차트 생성할 영역 -->
          <div id="lineChartArea" style="padding:0px 20px 0px 0px;"></div>
      <!-- 컨트롤바를 생성할 영역 -->
          <div id="controlsArea" style="padding:0px 20px 0px 0px;"></div>
        </div>
        </div>
     <jsp:include page="/common/foot.jsp"></jsp:include>
  </body>
<script type="text/javascript">
  var queryObject = "";
  var queryObjectLen = "";
  $.ajax({
      type : 'POST',
      url : 'bardata22.jsp',
      dataType : 'json',
      success : function(data) {
         
          queryObject = eval('(' + JSON.stringify(data,null, 2) + ')');             
          // stringify : 인자로 전달된 자바스크립트의 데이터(배열)를 JSON문자열로 바꾸기.   
          // eval: javascript 코드가 맞는지 검증하고 문자열을 자바스크립트 코드로 처리하는 함수 
          // queryObject.barlist[0].city ="korea"

          queryObjectLen = queryObject.barlist.length;
          // queryObject.empdetails 에는 4개의 Json 객체가 있음 

          alert('업데이트' + queryObjectLen);
          // alert(queryObject.barlist[0].city +queryObject.barlist[0].per );
      },
      error : function(xhr, type) {
          alert('server error occoured')
      }
  });
 
  var chartDrowFun = {
 
    chartDrow : function(){
        var chartData = '';
 
        //날짜형식 변경하고 싶으시면 이 부분 수정하세요.
        var chartDateformat     = "yyyy년MM월dd일";
        //라인차트의 라인 수
        var chartLineCount    = 10;
        //컨트롤러 바 차트의 라인 수
        var controlLineCount    = 10;
 
        function drawDashboard() {
 
          var data = new google.visualization.DataTable();
          //그래프에 표시할 컬럼 추가
          data.addColumn('datetime' , '날짜');
          data.addColumn('number'   , '판매량');
          data.addColumn('number'   , '판매가격');
          //그래프에 표시할 데이터
          var dataRow = [];

      		for (var i = 0; i < queryObjectLen; i++) {
      		var SELL_DATE = queryObject.barlist[i].SELL_DATE;
            var SELL_COUNT = queryObject.barlist[i].SELL_COUNT;
            var SELL_PRICE = queryObject.barlist[i].SELL_PRICE;
            dataRow = [new Date(SELL_DATE),SELL_COUNT,SELL_PRICE];
            data.addRow(dataRow);
            console.log('DATAROW : ' + dataRow);
          }
 
              var chart = new google.visualization.ChartWrapper({
                chartType   : 'LineChart',
                containerId : 'lineChartArea', //라인 차트 생성할 영역
                options     : {
                                isStacked   : 'percent',
                                focusTarget : 'category',
                                height          : 500,
                                width              : '100%',
                                legend          : { position: "top", textStyle: {fontSize: 13}},
                                pointSize        : 5,
                                series: {
                                    0: {targetAxisIndex: 0},
                                    1: {targetAxisIndex: 1}
                                  },
                                  vAxes: {
                                    // Adds titles to each axis.
                                    0: {title: '판매량'},
                                    1: {title: '판매금액'}
                                  },
   
                                tooltip          : {textStyle : {fontSize:12}, showColorCode : true,trigger: 'both'},
                                hAxis              : {format: chartDateformat, gridlines:{count:chartLineCount,units: {
                                                                    years : {format: ['yyyy년']},
                                                                    months: {format: ['MM월']},
                                                                    days  : {format: ['dd일']},
                                                                    hours : {format: ['HH시']},
                                                                    minutes : {format:['mm분']}
                                                                    }
                                									
                                                                  },textStyle: {fontSize:12}},
                  vAxis              :{minValue: 100,viewWindow:{min:0},gridlines:{count:-1},textStyle:{fontSize:12}},
                  animation        : {startup: true,duration: 1000,easing: 'in' },
                  annotations    : {pattern: chartDateformat,
                                  textStyle: {
                                  fontSize: 15,
                                  bold: true,
                                  italic: true,
                                  color: '#871b47',
                                  auraColor: '#d799ae',
                                  opacity: 0.8,
                                  pattern: chartDateformat
                                }
                              }
                }
              });
  
              var control = new google.visualization.ControlWrapper({
                controlType: 'ChartRangeFilter',
                containerId: 'controlsArea',  //control bar를 생성할 영역
                options: {
                    ui:{
                          chartType: 'LineChart',
                          chartOptions: {
                          chartArea: {'width': '60%','height' : 80},
                            hAxis: {'baselineColor': 'none', format: chartDateformat, textStyle: {fontSize:12},
                              gridlines:{count:controlLineCount,units: {
                                    years : {format: ['yyyy년']},
                                    months: {format: ['MM월']},
                                    days  : {format: ['dd일']},
                                    hours : {format: ['HH시']},
                                    minutes : {format:['mm분']}}
                              }}
                          }
                    },
                      filterColumnIndex: 0
                  }
              });
  
              var date_formatter = new google.visualization.DateFormat({ pattern: chartDateformat});
              date_formatter.format(data, 0);
  
              var dashboard = new google.visualization.Dashboard(document.getElementById('Line_Controls_Chart'));
              window.addEventListener('resize', function() { dashboard.draw(data); }, false); //화면 크기에 따라 그래프 크기 변경
              dashboard.bind([control], [chart]);
              dashboard.draw(data);
              console.log('Data : ' + data);
  
          }
            google.charts.setOnLoadCallback(drawDashboard);
        }
      }
  $(document).ready(function(){
    google.charts.load('current', {'packages':['line','controls']});
    chartDrowFun.chartDrow(); //chartDrow() 실행
  });
    </script>
</html>