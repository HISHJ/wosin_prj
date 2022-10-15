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
									<a href="#">
										<span>회원서비스</span>
									</a>
									
									<ul class="depth" >
										<li>
											<a href="#">회원서비스</a>
										</li>
										<li>
											<a href="page1.html">공연정보</a>
										</li>
										<li>
											<a href="subpage-ticketmethod.html">예매정보</a>
										</li>
										<li>
											<a href="page9.html">고객센터</a>
										</li>
										<li>
											<a href="subpage-way.html">오시는길</a>
										</li>
									</ul>
								</div>
							</li>
							<li>
								
							
							</li>
						</ul>
					</div>

				</div> 	    
