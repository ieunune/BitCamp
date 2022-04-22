<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>상품 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

	function fncGetUserList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct?&menu="+$("#menu").val()).submit();
	}
	
	$(function(){		
		$(".ct_list_pop td:nth-child(9)").on("click", function(){
			//alert($(this).children("input").val())
			//alert($(this).children("#prodNo").val())
			//alert('${product.prodNo}')
			$(window.parent.frames["rightFrame"].document.location).attr("href","/purchase/updateTranCode?prodNo="+$(this).children("input").val()+"&menu="+$("#menu").val());
			alert('배송이 완료되었습니다.')
		});
		
		 $( "td.ct_btn01:contains('검색')" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('검색')" ).html() );
				fncGetUserList(1);
		});
		
		$(".ct_list_pop td:nth-child(3)").on("click", function(){
			//alert($("#prodNo").text().trim());
			//alert($("#prodNo").val());
			//alert($(this).text().trim());
			//alert($('#prod_no').text.trim());
			//alert($('#prod_no').val());
			//alert('${product.prodNo}');
			//alert($('#prodNo').index(this));
			//alert($('#prod_No').index(this));
			//alert($('.ct_list_pop td:nth-child(3)').index(this));
			
			self.location="/product/getProduct?prodNo="+$(this).children("input").val()+"&menu="+$("#menu").val();
		});
		
		$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
		$("h7").css("color" , "red");
		$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
	});
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<div style="width: 98%; margin-left: 10px;">

		<form name="detailForm" action="/product/listProduct?menu=${param.menu}" method="post">

			<table width="100%" height="37" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
						width="15" height="37" /></td>
					<td background="/images/ct_ttl_img02.gif" width="100%"
						style="padding-left: 10px;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
							<c:if test="${param.menu =='manage'}">
							<td width="93%" class="ct_ttl01">상품 목록 조회</td>
							</c:if>
							<c:if test="${param.menu =='search'}">
							<td width="93%" class="ct_ttl01">상품 조회</td>
							</c:if>		
							</tr>
						</table>
					</td>
					<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
						width="12" height="37" /></td>
				</tr>
			</table>


			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td class="ct_list_b" width="100">표시개수</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="100">
					<select name="pageSize" id="selectPageSize"class="ct_input_g" style="width: 80px">
							<%-- ${ ! empty search.pageSize == 0 ? "selected" : "" }--%>
							<option value="0" onchange="alert('5')">5</option>
							<option value="1" onchange="alert('10')">10</option>
							<option value="2" onchange="alert('15')">15</option>
					</select>
					</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="100">
						▲<a href="/product/listProduct?menu=${param.menu}&order=1">높은가격순</a><br>
						▼<a href="/product/listProduct?menu=${param.menu}&order=2">낮은가격순 </a></td>
					<td class="ct_line02"></td>
					<c:if test="${ search.searchCondition != null}">
					<td align="right">
						<select name="searchCondition" class="ct_input_g" style="width: 80px">
							<option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
							<option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
							<option value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>상품가격</option>
					</select> <input type="text" 
									 name="searchKeyword" 
									 value="${! empty search.searchKeyword ? search.searchKeyword : ''}" 
									 class="ct_input_g"
									 style="width: 200px; height: 19px" /></td>
					</c:if>
					<c:if test="${ search.searchCondition == null }">
					<td align="right"><select name="searchCondition"
						class="ct_input_g" style="width: 80px">
							<option value="0">상품번호</option>
							<option value="1">상품명</option>
							<option value="2">상품가격</option>
					</select> <input type="text" name="searchKeyword" class="ct_input_g"
						style="width: 200px; height: 19px"></td>
					</c:if>
					<td align="right" width="70">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="17" height="23"><img
									src="/images/ct_btnbg01.gif" width="17" height="23"></td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01"
									style="padding-top: 3px;">검색</td>
								<td width="14" height="23"><img
									src="/images/ct_btnbg03.gif" width="14" height="23"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>

			<input type="hidden" id="menu" class="menu1" value="${param.menu}">
					
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td colspan="11">전체 ${ resultPage.totalCount} 건수, 현재 ${resultPage.currentPage} 페이지</td>
				</tr>
				<tr>
					<td class="ct_list_b" width="100">No</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">상품명<br><h7>(click : 상세정보)</h7>	</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">가격</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">등록일</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">현재상태</td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="808285" height="1"></td>
				</tr>
				<c:set var="i" value="0" />
				<c:forEach var="product" items="${list}">
					<c:set var="i" value="${i+1}"/>
				<tr class="ct_list_pop">
					<td align="center" id="prod_no">${ i }</td>
					<td></td>
					<td align="left" id="prodName">
						<input type="hidden" id="prodNo" value="${product.prodNo}">
						<c:if test="${param.menu =='manage'}">
							${product.prodName}
							<!-- <a href="/product/getProduct?prodNo=${product.prodNo}&menu=manage">${product.prodName}</a> -->
						</c:if>
						<c:if test="${param.menu =='search'}">
							<c:if test="${product.proTranCode==null}">
							<!--  <a href="/product/getProduct?prodNo=${product.prodNo}&menu=search">${product.prodName}</a> -->
							${product.prodName}
							</c:if>
							<c:if test="${product.proTranCode!=null}">
							${product.prodName}
							</c:if>
						</c:if>
					</td>
					<td></td>
					<td align="left">${product.price}</td>
					<td></td>
					<td align="left">${product.regDate}</td>
					<td></td>
					<td align="left" >
						<input type="hidden" id="prodNo" value="${product.prodNo}">
						<c:if test="${product.proTranCode==null}">
						판매중
						</c:if>
						<c:if test="${product.proTranCode=='000'}">
						구매완료
							<c:if test="${param.menu=='manage'}">
							<a id="tranState">배송하기</a> 
							</c:if>
						</c:if>
						<c:if test="${product.proTranCode=='001'}">
						배송중
						</c:if>
						<c:if test="${product.proTranCode=='002'}">
						배송완료
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="D6D7D6" height="1"></td>
				</tr>
				</c:forEach>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td align="center">
					<input type="hidden" id="currentPage" name="currentPage" value=""/>
						<jsp:include page="../common/pageNavigator.jsp"/>	
					</td>
				</tr>
			</table>
			
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td align="center">
						<hr>
						추가기능 아이디어 
						<hr>
						◆<a href="/product/listProduct?menu=${param.menu}">품절상품만 보기</a>
						◆<a href="/product/listProduct?menu=${param.menu}">품절상품포함 보기</a>
						◆<a href="/product/listProduct?menu=${param.menu}">품정상품제외 보기</a>
						<br>
						◆<a href="/product/listProduct?menu=${param.menu}">찜한 보기</a>
						◆<a href="/product/listProduct?menu=${param.menu}">별점 매기기</a>
						◆<a href="/product/listProduct?menu=${param.menu}">랭킹 보기</a>
						◆<a href="/product/listProduct?menu=${param.menu}">할인 이벤트</a>
						<br>
					</td>
				</tr>
			</table>
			<!--  페이지 Navigator 끝 -->
		</form>
	</div>
</body>
</html>
