<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 검색 결과</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
<link rel="stylesheet" type="text/css" href="css/bookSearch.css">
<script type="text/javascript" src="script/book.js"></script>
<script type="text/javascript" src="script/member.js"></script>
</head>
<body>
<header>
		<div id="header">
			<div id="log">
				<ul>
					<c:choose>
						<c:when test="${empty member}">
							<li><a href="BookServlet?command=member_login_form">로그인</a></li>
							<li>&#124;</li>
							<li><a href="BookServlet?command=member_terms_form">회원가입</a></li>
							<li>&#124;</li>
							<li><a href="BookServlet?command=member_mypage"
								onclick="return check()">마이페이지</a></li>
						</c:when>
						<c:otherwise>
							<li id="hello">안녕하세요, ${member.name}님</li>
							<li>&#124;</li>
							<li><a href="BookServlet?command=member_logout"
								onclick="return logout()">로그아웃</a></li>
							<li>&#124;</li>
							<c:if test="${member.lev == 'A'}">
								<li><a href="BookServlet?command=member_mypage"
									onclick="location.href='BookServlet?command=member_mypage">마이페이지</a>
								</li>
								<li>&#124;</li>
								<li><a href="BookServlet?command=member_list"
									onclick="buttonClick()">관리자 페이지</a></li>
							</c:if>
							
							<c:if test="${member.lev == 'B'}">
								<li><a href="BookServlet?command=member_mypage"
									onclick="location.href='BookServlet?command=member_mypage&id=${param.id}'">마이페이지</a>
								</li>
							</c:if>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<div id="headnav">
				<h1 id="hlogo">
					<a href="BookServlet?command=book_main"> <img
						src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FCdrYl%2FbtrUTKBvWql%2FneUhG0VH9Jro8xRV8EGl61%2Fimg.png"
						alt="LOGO" width="230px" height="70px">
					</a>
				</h1>
				<div class="search">
					<!-- <select name="" id="hoption">
                        <option value="제목검색">제목검색</option>
                        <option value="작가검색">작가검색</option>
                        <option value="카테고리검색">카테고리검색</option>
                    </select>
                    &#124;
                    <input type="text" id="hsearch" value="검색할 내용을 입력해주세요">
                    <i class="fa-solid fa-magnifying-glass" id="searchbu"
                    onclick="return searchCheck()"></i> -->

					<form action="BookServlet" method="post" name="frm2">
						<input type="hidden" name="command" value="book_search"> <select
							name="searchCategory" id="hoption">
							<option value="title">제목</option>
							<option value="author">작가</option>
							<option value="pub">출판사</option>
						</select> &#124; <input type="text" name="keyWord" id="hsearch"
							placeholder="검색할 내용을 입력해 주세요">
						<button onclick="return searchCheck()">
							<i class="fa-solid fa-magnifying-glass" id="searchbu"></i>
						</button>
					</form>
				</div>
				<!-- <div class="mypage">
                    <a href="#">
                    	<i class="fa-solid fa-cart-shopping"></i>
                    </a>
                    <a href="MemberServlet?command=member_mypage">
                    	<i class="fa-solid fa-circle-user"></i>
                    </a>
                </div> -->
			</div>
			<nav>
				<ul class="hlist1">
					<li><a href="BookServlet?command=book_list">도서 전체</a></li>
					<li>&middot;</li>
					<!-- <li><a href="#">카테고리</a></li>
	                <li>·</li> -->
					<li><a href="BookServlet?command=book_best">베스트</a></li>
					<li>&middot;</li>
					<li><a href="BookServlet?command=book_new">신간</a></li>
					<!-- <li><a href="#">PICKS</a></li>
	                <li><a href="#">CASTing</a></li>
	                <li><a href="#">교보ONLY</a></li> -->
				</ul>
				<%-- <c:if test="${member.lev == 'A'}">
	            <ul class="hlist2">
	                <li><a href="BookServlet?command=book_list">도서 관리</a></li>
	                <li><a href="#">출석체크</a></li>
	                <li><a href="#">
	                    <i class="fa-solid fa-circle-plus"></i>
	                </a></li>
	            </ul>
	            </c:if> --%>
			</nav>
		</div>
	</header>
	<div id="wrap" align="center">
		<h2>검색된 책 리스트</h2>
		<table class="list">
			<tr>
				<td colspan="7" style="padding-left: 10px;">검색 결과 총 ${count}건입니다.</td>
			</tr>
			<!-- <tr>
				<th>번호</th>
				<th>카테고리</th>
				<th>제목</th>
				<th>가격</th>
				<th>저자</th>
				<th>출판사</th>
				<th>평점</th>
			</tr> -->
			<c:forEach var="book" items="${searchResult}">
				<tr class="record">
					<td>${book.num}</td>
					<td><a href="BookServlet?command=book_detail&num=${book.num}">
							<img alt="" src="${book.pictureurl}" id="cover">
					</a></td>
					<td><b>카테고리</b> &nbsp; ${book.category}<br> <b>제목</b>
						&nbsp; <a href="BookServlet?command=book_detail&num=${book.num}">
							${book.title} </a> <br> <b>작가</b> &nbsp; ${book.author}<br>
						<b>출판사</b> &nbsp; ${book.pub}<br> <b>가격</b> &nbsp;
						${book.price}&nbsp;원<br> <b>줄거리</b> <br>${book.summary}
					</td>
					<!-- <th width="100px;"><a href="#" id="cart"> <img alt=""
							width="100%" height="100%"
							src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fb0cUga%2FbtrURTstBS4%2FvfCL8IU8BoC2CH9ogwjuT1%2Fimg.png">
							<br> <em>장바구니</em>
					</a></th> -->
				</tr>
			<%-- 	
				<tr class="record">
					<td>${book.num}</td>
					<td>${book.category}</td>
					<td><a href="BookServlet?command=book_detail&num=${book.num}">
							${book.title} </a></td>
					<td>${book.price}원</td>
					<td>${book.author}</td>
					<td>${book.pub}</td>
					<td>${book.grade}</td>
				</tr> --%>
			</c:forEach>
		</table>
	</div>
	<footer>
		<div id="foot1">
			<!-- <h1 id="flogo">
                    <a href="BookServlet?command=book_main">
                        <img src="images/4OJUNG logo2-2.png" alt="LOGO"
                        width="100%" height="100%">
                    </a>
                </h1> -->
			<div id="foot1-1">
				<ul>
					<li><a href="#">회사소개 </a></li>
					<li>&#124;</li>
					<li><a href="#">이용약관 </a></li>
					<li>&#124;</li>
					<li><a href="#"><b>개인정보처리방침 </b></a></li>
					<li>&#124;</li>
					<li><a href="#">청소년보호정책 </a></li>
					<li>&#124;</li>
					<li><a href="#">대량주문안내 </a></li>
					<li>&#124;</li>
					<li><a href="#">헙력사 </a></li>
					<li>&#124;</li>
					<li><a href="#">채용정보 </a></li>
					<li>&#124;</li>
					<li><a href="#">광고소개</a></li>
				</ul>
			</div>
			<div id="foot1-2">
				<p>대표이사 : 임채리 &#124; 주소 : (16455)경기도 수원시 팔달구 매산로1가 11-9 3F
					&#124; 사업자등록번호 : 000-00-00000</p>
				<p>
					대표전화 : 1544-0000(발신자 부담전화) &#124; FAX : 0000-000-0000(지역번호 공통)
					&#124; 경기도 통신판매업신고번호 : 제 000호&nbsp;&nbsp;
					<button>사업자정보확인</button>
				</p>
				<p>&#169; SAO BOOK CENTRE</p>
			</div>
		</div>
		<!-- <div id="foot2">
            	<p>경기도 수원시 매산로1가 11-9</p>
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d662.6889364947248!2d126.99987109621723!3d37.2680971866107!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357b431e8d19c277%3A0xceb17aba7af9e33d!2z7J207KCg7Lu07ZOo7YSw7JWE7Yq47ZWZ7JuQ!5e0!3m2!1sko!2skr!4v1672026021259!5m2!1sko!2skr"
                 width="100%" height="230" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div> -->
	</footer>
</body>
</html>