<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>

<link rel="stylesheet" type="text/css" href="ram/css/ram4.css" />

<!DOCTYPE html>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> </title>
</head>
<body>
<div id="main">
<table id="notice">
	<tr>
		<td colspan="2"><h2>NOTICE</h2></td>
		<td><a href="#"><h6>+더보기</h6></a></td>
	</tr>
	<c:forEach var="list"  items="${list}"> 
	<tr>
		<td id="icon">&nbsp;▶</td>
		<td id="subject">${list.subject }</td>
		<td>${list.reg_date }</td>
	</tr>
	</c:forEach>
</table>
</div>

<div>
<figure class="snip1132">
  <img src="ram/images/1.jpg" alt="sample" />
  <figcaption>
    <div class="heading">
      <h3><span>Study Together</span></h3>
    </div>
    <div class="caption">
      <p>가나다라</p>
    </div>
  </figcaption>
  <a href="#"></a>
</figure>

 <figure class="snip1132">
  <img src="ram/images/4.jpg" alt="sample2" />
  <figcaption>
    <div class="heading">
      <h3><span>Study Search</span></h3>
    </div>
    <div class="caption">
      <p>가나다라</p>
    </div>
  </figcaption>
  <a href="#"></a>
</figure>
<figure class="snip1132">
  <img src="ram/images/3.jpg" alt="sample3" />
  <figcaption>
    <div class="heading">
      <h3><span>Study Room</span></h3>
    </div>
    
    <div class="caption">
      <p>가나다라</p>
    </div>
  </figcaption>
  <a href="#"></a>
</figure> 
</div>
</body>
</html>