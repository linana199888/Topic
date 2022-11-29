<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"href="http://cdn.datatables.net/1.10.15/css/jquery.dataTables.css">
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
</head>
<body>
<div class="container">
<table class="table table-hover" id="example" class="display nowrap" style="width:100%">
    <tr>
        <th>Reservation_ID</th>
        <th>Reservation_date</th>
        <th>Reservation_time</th>
        <th>Reservation_Person</th>
        <th>Reservation_name</th>
        <th>Reservation_phone</th>
        <th>Reservation_email</th>
        <th>Action</th>
	</tr>        	    
	    <c:forEach var="row" items="${ReservationList}">
		<tr>
		    <td>${row.reservation_Id}</td>
		  	<td>${row.reservation_Date}</td>
		  	<td>${row.reservation_Time}</td>
		  	<td>${row.reservation_Person}</td>
		  	<td>${row.reservation_Name}</td>
		  	<td>${row.reservation_Phone}</td>
		  	<td>${row.reservation_Email}</td>	
		    <td><input type="button" value="修改"></td>		   
		    <td><input type="button" value="刪除"></td>	 
		</tr>
	    </c:forEach>
	</table>
	<button id="button1">test</button>
	</div>
   <br/>  
<table id="table_id_example" class="display" class="display nowrap">
    <thead>
        <tr>
            <th>Column 1</th>
            <th>Column 2</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Row 1 Data 1</td>
            <td>Row 1 Data 2</td>
        </tr>
        <tr>
            <td>Row 2 Data 1</td>
            <td>Row 2 Data 2</td>
        </tr>
    </tbody>
</table>
   <script>
   function show()
   {
	/*   //alert("1");
	   var table = $("#table1").DataTable();
	   alert(table);
	   var data = table.rows();	    
	   alert(data);*/
	  
   }
   function send()
   {
	//$("#button1").click(show)
	/* $("#table1").DataTable({
		   "searching": true, // 預設為true 搜尋功能，若要開啟不用特別設定
		    "paging": false, // 預設為true 分頁功能，若要開啟不用特別設定
		    "ordering": false, // 預設為true 排序功能，若要開啟不用特別設定
		    "sPaginationType": "full_numbers", // 分頁樣式 預設為"full_numbers"，若需其他樣式才需設定
		    "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]], //顯示筆數設定 預設為[10, 25, 50, 100]
		    "pageLength":'50'// 預設為'10'，若需更改初始每頁顯示筆數，才需設定
		    "processing": true, // 預設為false 是否要顯示當前資料處理狀態資訊
		    "serverSide": false, // 預設為false 是否透過Server端處理分頁…等
		    "stateSave": true, // 預設為false 在頁面刷新時，是否要保存當前表格資料與狀態
		    "destroy": true, // 預設為false 是否銷毀當前暫存資料
		    "info": true, // 預設為true　是否要顯示"目前有 x  筆資料"
		    "autoWidth": false, // 預設為true　設置是否要自動調整表格寬度(false代表不要自適應)　　　　
		    "scrollCollapse": true, // 預設為false 是否開始滾軸功能控制X、Y軸
		    "scrollY": "200px", // 若有設置為Y軸(垂直)最大高度
		    "dom": 'lrtip',// 設置搜尋div、頁碼div...等基本位置/外觀..等，詳細可看官網
	   });*/
	   /*$("#table2").DataTable({
		    "searching": true, //搜尋功能, 預設是開啟
		    "paging": true, //分頁功能, 預設是開啟
		    "ordering": true //排序功能, 預設是開啟
		});*/
	   $(document).ready( function () {
			$('#table_id_example').DataTable();
		} );
   }
   $(document).ready(send);
   </script>
</body>
</html>