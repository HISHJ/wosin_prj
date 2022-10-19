<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="subpage 두번째 header메뉴" %>
<% 
//값 넘김 검증 완료
String memberId = (String)session.getAttribute("memberId");
System.out.println(memberId);
%>    
	<!-- 로그인영역 -->
				<div id="depth_w">
					<div class="inner">
						<ul class="clrearfox dot dep1 li2">
							<li class="home">
								<span>
									<span>HOME</span>
								</span>
							</li>
							<li>
								<div class="rel">
									<a href="http://localhost/group2_prj/mypage/memberMng.jsp">
										<span>개인화서비스</span>
									</a>
									<!-- display:none -->
									<ul class="depth" >
										<a href="http://localhost/group2_prj/mypage/memberMng.jsp">
											<span>개인화서비스</span>
										</a>
										<li>
											<a href="http://localhost/group2_prj/reservation/show_search.jsp">공연정보</a>
										</li>
										<li>
											<a href="http://localhost/group2_prj/subpage/subpage-ticketMethod.jsp">예매정보</a>
										</li>
										<li>
											<a href="http://localhost/group2_prj/subpage/subpage-FAQ1.jsp">고객센터</a>
										</li>
										<li>
											<a href="http://localhost/group2_prj/subpage/subpage-location.jsp">오시는길</a>
										</li>
									</ul>
								</div>
							</li>
							<li>
								<div class="rel">
									<a href="http://localhost/group2_prj/mypage/ticket_page.jsp"><span>예매내역 확인,취소</span></a>
									<ul class="depth">
									<li><a href="http://localhost/group2_prj/mypage/memberMng.jsp" ><span>개인화서비스</span></a></li>
									<li><a href="http://localhost/group2_prj/mypage/passModify.jsp" ><span>비밀번호변경</span></a></li>
									<li><a href="http://localhost/group2_prj/mypage/mypage.jsp" ><span>회원정보 수정</span></a></li>
									<li><a href="http://localhost/group2_prj/reservation/ticket_page.jsp" ><span>예매내역 확인·취소</span></a></li>
									</ul>
									</div>
							
							</li>
						</ul>
					</div>

				</div>