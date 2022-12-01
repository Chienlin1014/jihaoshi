<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.button {
	border-radius: 1rem;
	border: 1px solid #ccc;
}
#content {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	width: 95%;
	margin: auto;
}
#orderTable {
	display: flex;
    justify-content: center;
    flex-direction: column;
}
table {
  border: 1px solid #ccc;
  border-collapse: collapse;
  margin: 0;
  padding: 0;
  width: 95%;
  table-layout: fixed;
}

table caption {
  font-size: 1.5em;
  margin: .5em 0 .75em;
}

table tr {
  background-color: #f8f8f8;
  border: 1px solid #ddd;
  padding: .35em;
}

table th,
table td {
  padding: .625em;
  text-align: center;
}

table th {
  font-size: .85em;
  letter-spacing: .1em;
  text-transform: uppercase;
}

@media screen and (max-width: 600px) {
  table {
    border: 0;
  }

  table caption {
    font-size: 1.3em;
  }
  
  table thead {
    border: none;
    clip: rect(0 0 0 0);
    height: 1px;
    margin: -1px;
    overflow: hidden;
    padding: 0;
    position: absolute;
    width: 1px;
  }
  
  table tr {
    border-bottom: 3px solid #ddd;
    display: block;
    margin-bottom: .625em;
  }
  
  table td {
    border-bottom: 1px solid #ddd;
    display: block;
    font-size: .8em;
    text-align: right;
  }
  
  table td::before {
    /*
    * aria-label has no advantage, it won't be read inside a table
    content: attr(aria-label);
    */
    content: attr(data-label);
    float: left;
    font-weight: bold;
    text-transform: uppercase;
  }
  
  table td:last-child {
    border-bottom: 0;
  }
}
</style>
</head>
<body>
	<%@ include file="../navbar.file"%>
	<br>
	<div id="CONTENT">
		<c:choose>
			<c:when test="${empty orders}">
				<span style="font-size: 16px;">您尚未有購買紀錄喔！
				<button class="button">
					<a href="${ctxPath}/meal/mealController?action=listAll"
						style="text-decoration: none; color: #333;">去選購</a>
				</button>
				</span>
			</c:when>
			<c:otherwise>
				<div id="orderTable" style="margin: auto">
					<table style="margin: 0px auto;">
						<tr>
							<td style="width: 200px" class="order">訂單編號</td>
							<td style="width: 150px" class="order">購買時間</td>
							<td style="width: 100px" class="order">訂單總價</td>
							<td style="width: 100px" class="order">訂單狀態</td>
							<td style="width: 100px" class="order">查看訂單明細</td>
						</tr>
						<c:forEach var="order" items="${orders}" varStatus="loop">
							<tr>
								<td class="order">${order.orderNo}</td>
								<td class="order"><fmt:formatDate
										value="${order.orderTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td class="order"><fmt:formatNumber value="${order.price}"
										pattern="#,###" /></td>
								<td class="order">${OrderStatus[order.status]}</td>
								<td class="order">
									<form method="get" action="orderDetailController"
										id="form${loop.index}">
										<input type="text" name="action" value="listOrderDetail"
											hidden> <input type="text" name="orderNo"
											value="${order.orderNo}" hidden>
									</form>
									<button type="submit" form="form${loop.index}" class="button">查看明細</button>
								</td>
							</tr>
						</c:forEach>
						</c:otherwise>
						</c:choose>
					</table>
				</div>
	</div>
</body>
</html>
