<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 등록</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
<link rel="stylesheet" type="text/css" href="css/register.css">
<script type="text/javascript" src="script/book.js"></script>
<script type="text/javascript" src="script/member.js"></script>
</head>
<body>
	<div id="container">
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
			<h2>도서 등록</h2>
			<form name="frm" method="post" action="BookServlet">
				<input type="hidden" name="command" value="book_register">
				<table>
					<tr>
						<th>카테고리</th>
						<td><select id="category" name="category" size="1">
								<option value="" disabled selected>카테고리를 선택하세요.</option>
								<option value="국어 외국어 사전">국어 외국어 사전</option>
								<option value="청소년">청소년</option>
								<option value="경제 경영">경제 경영</option>
								<option value="가정 살림">가정 살림</option>
								<option value="인문">인문</option>
								<option value="소설/시/희곡">소설/시/희곡</option>
								<option value="에세이">에세이</option>
								<option value="수험서 자격증">수험서 자격증</option>
								<option value="만화/라이트노벨">만화/라이트노벨</option>
								<option value="종교">종교</option>
								<option value="자연과학">자연과학</option>
								<option value="자기계발">자기계발</option>
								<option value="예술">예술</option>
								<option value="유아">유아</option>
								<option value="어린이">어린이</option>
								<option value="사회 정치">사회 정치</option>
								<option value="IT 모바일">IT 모바일</option>
						</select></td>
					</tr>
					<tr>
						<th>도서명</th>
						<td><input type="text" name="title" size="50"></td>
					</tr>
					<tr>
						<th>작가</th>
						<td><input type="text" name="author" size="50"></td>
					</tr>
					<tr>
						<th>출판사</th>
						<td><input type="text" name="pub"></td>
					</tr>
					<tr>
						<th>가격</th>
						<td><input type="text" name="price">&nbsp;원</td>
					</tr>
					<tr>
						<th>줄거리</th>
						<td><textarea cols="110" rows="10" name="summary"></textarea></td>
					</tr>
					<tr>
						<th>사진</th>
						<td>
						<label for="file"><div id="upload">파일 업로드</div></label>
						<input type="file" id="file" name="pictureurl">
						</td>
					</tr>
					<tr>
						<th>평점</th>
						<td><input type="text" name="grade"></td>
					</tr>
				</table>
				<br>
				<br> <input type="submit" value="등록" id="button"
					onclick="return bookCheck()"> <input type="reset"
					value="다시 작성" id="button"> <input type="button"
					value="도서 목록" id="button"
					onclick="location.href='BookServlet?command=book_list'">
			</form>
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
	</div>
</body>
</html>