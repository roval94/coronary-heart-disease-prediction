<!DOCTYPE html>
<%@page import="com.helper.StringHelper"%>
<%@page import="com.db.DBUtils"%>
<html>
  <head>
    <!-- EXTERNAL LIBS-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://www.google.com/jsapi"></script>
<%

String pid=StringHelper.n2s(request.getParameter("pid"));
String query="SELECT  concat(\"data.addRow([new Date('\",ddate,\"'),parseFloat(\",temp,\"),parseFloat(\",heartbeat,\")]);\") as data1  FROM `pdata` where pid="+pid+" order by ddate";

%>
    <!-- EXAMPLE SCRIPT -->
    <script>

      // onload callback
      function drawChart() {

     
        


        var data = new google.visualization.DataTable();

        data.addColumn('datetime', 'Time');
        data.addColumn('number', 'Temprature');
        data.addColumn('number', 'Heart Rate');
        <%=DBUtils.getCSV(query)%>


        var chart = new google.visualization.LineChart($('#chart').get(0));

        chart.draw(data, {
          title: 'Patients Real Time Data',
			width:380,
  height: 280,
	
  backgroundColor: '#000000',
	
  is3D: true,
	    titleTextStyle: {
      color: 'red'
  },  
  hAxis: {
      textStyle: {
          color: 'lightgreen'
      },
      titleTextStyle: {
          color: 'lightgreen'
      }
  },
  vAxis: {
      textStyle: {
          color: 'yellow'
      },
      titleTextStyle: {
          color: 'yellow'
      }
  },
  legend: {
      textStyle: {
          color: 'red'
      }
  }
        });

      }

      // load chart lib
      google.load('visualization', '1', {
        packages: ['corechart']
      });

      // call drawChart once google charts is loaded
      google.setOnLoadCallback(drawChart);

    </script>

  </head>
  <body>
    <div id="chart" style="width: 100%;"></div>
  </body>
</html>