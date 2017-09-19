<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jstl/sql_rt" %>

<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sql 태그 예제 - update, param</title>
</head>
<body>
<h3>sql 태그 예제 - update, param</h3>
<sql:update dataSource="jdbc:BoardDB">
		UPDATE BOARD SET WRITER=?, subject=?, passwd=? WHERE NUM = ?
		<sql:param value="${ 'smile' }" />
		<sql:param value="${ 'jstl sql test' }" />
		<sql:param value="${ 'oracle' }" />
		<sql:param value="${ 1 }" />
</sql:update>

<sql:query var="rs" dataSource="jdbc:BoardDB">
			SELECT * FROM BOARD
</sql:query>
	

<table border="1">
	<tr>  <!-- 필드명 출력 -->
		<c:forEach var="columnName"  items="${ rs.columnNames }">
				<th> <c:out value="${ columnName }" /> </th>
		</c:forEach>	
	</tr>
	<c:forEach var="row" items="${ rs.rowsByIndex }" >  <!-- 레코드의 수 만큼 반복한다 -->
		<tr>
				<c:forEach var="column" items="${ row }"  varStatus="i"> <!-- 레코드의 필드 수 만큼 반복한다 -->
					<td>
						<c:if test="${ column != null }"> <!--  해당 필드값이 null이 아니면... -->
								<c:out value="${ column }" />
						</c:if>
						<c:if test="${ column == null }"> <!--  해당 필드값이 null이면... -->
								&nbsp;
						</c:if>
					</td>
				</c:forEach>
		</tr>
	</c:forEach>
</table>
</body>
</html>








