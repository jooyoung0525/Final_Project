<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <link href="${pageContext.request.contextPath}/resources/css/modern-business.css" rel="stylesheet">
  
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top" style="font-family: 'Jua', sans-serif; font-size: 15px;">
    <div class="container">
      <a class="navbar-brand" href="${pageContext.request.contextPath}/"><img alt="로고" src="${pageContext.request.contextPath}/resources/img/logo2.png" style="width:150px;"></a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/store/main">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/store/list">N차_스토어</a>
          </li>
          <li class="nav-item dropdown">
 			<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              N차_소식
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="${pageContext.request.contextPath}/notice/list">N차_공지</a>
              <a class="dropdown-item" href="${pageContext.request.contextPath}/event/proceedList">N차_이벤트</a>
            </div>         
             </li>
		<c:if test="${not empty sessionScope.member}">
		  <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/store/customer/mypage">마이페이지(고객)</a>
          </li>
    	</c:if>
		 <c:if test="${not empty sessionScope.seller}">
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/store/created">판매글올리기</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/store/mypage/main">마이페이지</a>
          </li>
          </c:if>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/">중고거래</a>
          </li>
	         <c:if test="${empty sessionScope.member && empty sessionScope.seller}">
	     <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/member/login">로그인</a>
          </li>      
	     <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/ncha/member">회원가입</a>
          </li>      
            </c:if>

             <c:if test="${not empty sessionScope.member}">
            <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              	<span style="color:skyblue;">[${sessionScope.member.userName}]님 </span>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
              <a class="dropdown-item" href="${pageContext.request.contextPath}/member/pwd">정보수정</a>
              
                 <c:if test="${sessionScope.member.userId=='admin'}">
                    	<a class="dropdown-item" href="${pageContext.request.contextPath}/admin">관리자</a>
                </c:if>
            </div>
          </li>
               <li class="nav-item" style="display: flex; align-items: center;"> 
               	<a class="nav-link" href="${pageContext.request.contextPath}/store/customer/cartlist"><i class="fas fa-shopping-cart"></i></a><div class="cartCount" style="width:16px; height:16px; color:#3c3c3c; border-radius: 50%; background-color: silver; text-align: center; line-height:-2px; "></div>
               </li>
          
            </c:if>
            
                        <c:if test="${not empty sessionScope.seller}">
                <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              	<span style="color:skyblue;">[${sessionScope.seller.sellerName}]님 </span>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="${pageContext.request.contextPath}/seller/logout">로그아웃</a>
              <a class="dropdown-item" href="${pageContext.request.contextPath}/seller/pwd">정보수정</a>
              
                 <c:if test="${sessionScope.member.userId=='admin'}">
                    	<a class="dropdown-item" href="${pageContext.request.contextPath}/admin">관리자</a>
                </c:if>
            </div>
          </li>        
            </c:if>
	         
        </ul>
      </div>
    </div>
  </nav>
  <script>
  function login1() {
		location.href="${pageContext.request.contextPath}/member/login";
	}
  function ajaxFun1(url, method, dataType, query, fn) {
		$.ajax({
			type:method
			,url:url
			,data:query
			,dataType:dataType
			,success:function(data) {
				fn(data);
			}
			,beforeSend:function(jqXHR) {
		        jqXHR.setRequestHeader("AJAX", true);
		    }
		    ,error:function(jqXHR) {
		    	if(jqXHR.status===403) {
		    		login1();
		    		return false;
		    	}
		    	
		    	console.log(jqXHR.responseText);
		    }
		});
	}
  function listPage1() {
		var url = "${pageContext.request.contextPath}/store/cartHeader";
		var query = "page=1";
		
		var fn = function(data){
			$(".cartCount").text(data.check);
		};
		
		ajaxFun1(url, "get", "json", query, fn);
	}
  $(function(){
	  <c:if test="${not empty sessionScope.member.userId}">
	  listPage1();
	  </c:if>
  });
  </script>
