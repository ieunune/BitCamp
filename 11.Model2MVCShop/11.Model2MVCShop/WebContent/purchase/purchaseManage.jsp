<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!--  meta  -->
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--  bootstrap CDN  -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--  bootstrap DropDown CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
<!--  bootstrap DropDown JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
<!-- jQuery JS -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!--  CSS -->
<style>
body {
	padding-top: 50px;
}
button{
	width: 280px;
	height: 30px;
	border : 1px solid black;
	background: black;
	color : white;
	font-size: 15px;
}
</style>

<script type="text/javascript">
	function fncGetUserList(currentPage) {
		$("#currentPage").val(currentPage)
		if( ${param.tranStateCode != null}){
			$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase?tranStateCode=${param.tranStateCode}").submit();
		} else {
			$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase").submit();
		}
	}
	
	$(function(){
		$("td:nth-child(1)").on("click",function(){
			self.location="/purchase/getPurchase?tranNo="+$(this).children("input").val();
		});
		
		$("td:nth-child(2)").on("click",function(){
			self.location="/user/getUser?userId="+$(this).children("input").val();
		});
		
		$("td:nth-child(1)").css("color","red");
		$("h7").css("color","red");
		
		$("td:nth-child(2)").css("color","blue");
		
		//$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		
		$("#state").on("click",function(){
			//alert($(this).children("#tranNo").val())
			//alert($(this).children("#userId").val())
			$(self.location).attr("href","/purchase/updateTranCodeByTranNo?tranNo="+$(this).children("#tranNo").val()+"&userId="+$(this).children("#userId").val());
			alert('???????????? ??????????.')
		});
		
		$("button:contains('????????')").on("click", function(){
			$(self.location).attr("href","/purchase/listPurchase");
		});
		
		$("button:contains('????????')").on("click", function(){
			$(self.location).attr("href","/purchase/listPurchase?tranStateCode=000");
		});
		
		$("button:contains('??????')").on("click", function(){
			$(self.location).attr("href","/purchase/listPurchase?tranStateCode=001");
		});
		
		$("button:contains('????????')").on("click", function(){
			$(self.location).attr("href","/purchase/listPurchase?tranStateCode=002");
		});
		
		$("#tranState").on("click", function(){	
			$(self.location).attr("href","/purchase/updateTranCodeByTranNo?tranNo="+$(this).children("#tranNo").val()+"&tranCode="+$("#tranCode").val());
			alert('?????? ??????????????.');
		});
	});
</script>
</head>

<body>
	
	<jsp:include page="/layout/toolbar.jsp"></jsp:include>
	
	<form>
	<input type="hidden" id="menu" value="${param.menu}">
	<input type="hidden" id="currentPage" name="currentPage" value=""/>
	<div class="container">
	
		<div class="page-header text-info">
			<h3>????????????</h3>
		</div>
	
		<div class="row">
			<div class="col-md-6 text-left">
				<p class="text-primary">
					???? ${resultPage.totalCount} ????, ???? ${resultPage.currentPage} ??????
				</p>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12 text-left">
				<button type="button"> ????????</button>
				<button type="button"> ????????</button>
				<button type="button"> ??????</button>
				<button type="button"> ????????</button>
			</div>
		</div>
		
		<br/>
		
		<table class="table table-hover table-striped">
			<thead>
				<tr>
					<th>????????</th>
					<th>?????? ID</th>
					<th>?????? ????</th>
					<th>??????</th>
					<th>????????</th>
					<th>????????</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="purchase" items="${list}">
					<c:set var="i" value="${ i+1 }" />
				<tr>
				<td align="center">
					<input type="hidden" id="tranNo" value="${purchase.tranNo}">
					${ i }
					</td>
					
					<td align="left">
					<input type="hidden" id="userId" value="${purchase.buyer.userId}">
					${purchase.buyer.userId}
					</td>
					
					<td align="left">${purchase.receiverName}</td>
					
					<td align="left">${purchase.receiverPhone}</td>
					
					<td align="left">
					${purchase.divyAddr}</td>
					
					<td align="left">
						<c:if test="${purchase.tranCode=='000'}">
							????????
							<a id="tranState">????????
								<input type="hidden" id="tranNo" value="${purchase.tranNo}">
								<input type="hidden" id="tranCode" value="001">
							</a>
						</c:if>
						<c:if test="${purchase.tranCode=='001'}">
							??????
							
						</c:if>
						<c:if test="${purchase.tranCode=='002'}">
							????????	
						</c:if>
					</td>
				<tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	

	<jsp:include page="../common/pageNavigator_new.jsp"/>	
	</form>		

</body>
</html>