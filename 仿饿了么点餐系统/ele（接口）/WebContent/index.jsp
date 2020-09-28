<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Hello API</title>
<!-- jQuery -->
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
</head>
<body>
<h1>Hello API</h1>
<a  onclick="getJson()">Ajax获取json数据</a>
</body>
<script type="text/javascript">
function getJson(){
	alert("getJson数据成功");
	$.post("${pageContext.request.contextPath}/login/getloginuser.action",null,function(result){
		alert(result.json);
		alert(JSON.stringify(result));
	},"json");
}
</script>
</html>
