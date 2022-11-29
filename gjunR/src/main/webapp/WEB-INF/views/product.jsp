<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<h2>Product Information</h2>
<form:form>
   <table>
    <tr>
        <td><form:label path="product_ID">ID：</form:label></td>
        <td><form:input path="product_ID" /></td>
    </tr>
    <tr>
        <td><form:label path="product_Catagory">種類：</form:label></td>
        <td><form:input path="product_Catagory" /></td>
    </tr>
    <tr>
        <td><form:label path="product_Name">名字：</form:label></td>
        <td><form:input path="product_Name" /></td>
    </tr>
        <tr>
        <td><form:label path="product_Price">價錢：</form:label></td>
        <td><form:input path="product_Price" /></td>
    </tr>
        <tr>
        <td><form:label path="ImagePath">路徑：</form:label></td>
        <td><form:input path="ImagePath"/></td>
    </tr>
        <tr>
        <td><form:label path="product_Describe">敘述：</form:label></td>
        <td><form:input path="product_Describe" /></td>
    </tr>
    <tr>
        <td colspan="2">
                </td>
    </tr>
</table>  
            <input type="submit" id="Create" value="新增產品"/>
             <input type="button" id="Read" value="查詢產品"/>
             <input type="button" id="Update" value="修改產品"/>
             <input type="button" id="Delete" value="刪除產品"/>
<div id="div1"></div>
</form:form>
<script>
   function rs(data){
	
     $("#div1").html(data);
   }
   function Create(evt){
	   evt.preventDefault();
	   var id=parseInt($("#product_ID").val());
	   var ca=$("#product_Catagory").val();
	   var n=$("#product_Name").val();
	   var p=$("#product_Price").val();
	   var i=$("#ImagePath").val();
	   var d=$("#product_Describe").val();
       $.post("product/insert",{"product_ID":id,"product_Catagory":ca,"product_Name":n,"product_Price":p,"ImagePath":i,"product_Describe":d},rs);
	   return false;
   }
   function Read()
   {
	   $.get("product/read",rs);
   }
   function Update(evt)
   {
	   evt.preventDefault();
	   var id=parseInt($("#product_ID").val());
	   var ca=$("#product_Catagory").val();
	   var n=$("#product_Name").val();
	   var p=$("#product_Price").val();
	   var i=$("#ImagePath").val();
	   var d=$("#product_Describe").val();
       $.post("product/update",{"product_ID":id,"product_Catagory":ca,"product_Name":n,"product_Price":p,"ImagePath":i,"product_Describe":d},ds);
	   return false;
   }
   function ds(data){
		alert('修改成功')
	     $("#div1").html(data);
	   }
   function Delete(evt)
   {
	   evt.preventDefault();
	   var id=parseInt($("#product_ID").val());
	   var ca=$("#product_Catagory").val();
	   var n=$("#product_Name").val();
	   var p=$("#product_Price").val();
	   var i=$("#ImagePath").val();
	   var d=$("#product_Describe").val();
       $.post("product/delete",{"product_ID":id,"product_Catagory":ca,"product_Name":n,"product_Price":p,"ImagePath":i,"product_Describe":d},ws);
	   return false;
   }
   function ws(data){
	   alert('刪除成功')
	     $("#div1").html(data);
	   }
   function start(){
	   $("form").submit(Create);
	   $("#Read").click(Read);
	   $("#Update").click(Update);
	   $("#Delete").click(Delete);
   }
   $(document).ready(start);
</script>
</body>
</body>
</html>