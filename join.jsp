<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
</head>
<body>

<script type="text/javascript" src="check.js"></script>

<jsp:include page="header.jsp"></jsp:include>

<%

Connection conn = null ; // 초기값 설정 
Statement stmt = null ;
String custno ="" ; // 문자열 초기값 설정

try { 
	conn = Util.getConnection(); // DB 연결 , 위에서 선언한 conn 관련
	stmt = conn.createStatement(); // SQL 실행 관련 변수 생성
	String sql = "select max(custno)+1 custno from member_tbl_02" ; // SQL 코드 입력 처리 , ""안 대/소문자 가능, 띄어쓰기는 주의할 것
	ResultSet rs = stmt.executeQuery(sql); // SQL 실행 결과 값 = rs
	rs.next() ; // 1 개의 결과 출력
	custno = rs.getString("custno") ;
	}

catch(Exception e) {
	e.printStackTrace(); // 단계별 에러 발생과 경로 출력
	}// 예외처리
%> 

<section style = " position: fixed ; top: 60px ; width: 100% ; height: 100% ;
background-color: lightgray ; color: black ; line-height: 20px ; font-size: 10px ; padding-left: 20px "> 
<h2 style = " text-align: center "> <b>홈쇼핑 회원 등록 </b> </h2> <br>

<form method= "post" action= "action.jsp" name="frm" style =" display: flex; align-items: center; justify-content: center ; text-align: center ">

<input type="hidden" name="mode" value="insert">

<table border="1">

<tr> 
<td>회원번호(자동발생) </td> 
<td> <input type ="text" name="custno" value = "<%=custno  %>" readonly > </td>
</tr>

<tr> 
<td>회원성명 </td> 
<td> <input type ="text" name="custname" value=""> </td>
</tr>

<tr> 
<td>회원전화 </td> 
<td> <input type ="text" name="phone" value=""> </td>
</tr>

<tr> 
<td>회원주소 </td> 
<td> <input type ="text" name="address" value=""> </td>
</tr>

<tr> 
<td>가입일자 </td> 
<td> <input type ="text" name="joindate" value=""> </td>
</tr>

<tr> 
<td>고객등급[A:VIP,B:일반,C:직원] </td> 
<td> <input type ="text" name="grade" value=""> </td>
</tr>

<tr> 
<td>도시코드 </td> 
<td> <input type ="text" name="city" value=""> </td>
</tr>

<tr>
	<td colspan="2">
	  <input type="submit" value="등록" onclick="return joinCheck()" > &nbsp;
	  <input type="button" value="조회" onclick="return searchCheck()">
	</td>
</tr>


</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>