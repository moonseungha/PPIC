<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PPIC</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<jsp:include page="appMenu.jsp"/>
	
	<script>
		window.onload = function(){
			// 부서 mouseover
			const m2 = document.getElementById("menu-2")
			m2.addEventListener("mouseover", function(){
				const arr1 = document.getElementsByClassName("menu1");
				for(let i=0; i<arr1.length; i++){
		        	arr1[i].style = 'display:none';
				}
				const arr2 = document.getElementsByClassName("menu2");
				for(let i=0; i<arr2.length; i++){
		        	arr2[i].style = 'display:none';
				}
				const arr3 = document.getElementsByClassName("menu3");
				for(let i=0; i<arr3.length; i++){
		        	arr3[i].style = 'display:block';
				}
				const arrm2 = document.getElementsByClassName("m2");
				for(let i=0; i<arrm2.length; i++){
		        	arrm2[i].style = 'margin-left: 19px';
				}
			});
			m2.addEventListener("mouseout", function(){
				const arr1 = document.getElementsByClassName("menu1");
				for(let i=0; i<arr1.length; i++){
		        	arr1[i].style = 'display:block';
				}
				const arr2 = document.getElementsByClassName("menu2");
				for(let i=0; i<arr2.length; i++){
		        	arr2[i].style = 'display:block';
				}
				const arr3 = document.getElementsByClassName("menu3");
				for(let i=0; i<arr3.length; i++){
		        	arr3[i].style = 'display:none';
				}
				const arrm2 = document.getElementsByClassName("m2");
				for(let i=0; i<arrm2.length; i++){
		        	arrm2[i].style = '';
				}
			});
			
			// 참조 mouseover
			const m12 = document.getElementById("menu-1-2")
			m12.addEventListener("mouseover", function(){
				const arr2 = document.getElementsByClassName("menu2");
				for(let i=0; i<arr2.length; i++){
		        	arr2[i].style = 'display:none';
				}
			});
			m12.addEventListener("mouseout", function(){
				const arr2 = document.getElementsByClassName("menu2");
				for(let i=0; i<arr2.length; i++){
		        	arr2[i].style = 'display:block';
				}
			});
			
			// 중요 mouseover
			const m13 = document.getElementById("menu-1-3")
			m13.addEventListener("mouseover", function(){
				const arr2 = document.getElementsByClassName("menu2");
				for(let i=0; i<arr2.length; i++){
		        	arr2[i].style = 'display:none';
				}
			});
			m13.addEventListener("mouseout", function(){
				const arr2 = document.getElementsByClassName("menu2");
				for(let i=0; i<arr2.length; i++){
		        	arr2[i].style = 'display:block';
				}
			});
			
			// 개인-기안-진행중 black
			document.getElementById("menu-1").style = 'color:black; font-weight:600';
			document.getElementById("menu-1-1").style = 'color:black; font-weight:600';
			document.getElementById("menu-1-1-1").style = 'color:black; font-weight:600';
			
			document.getElementById("menu-1-1-1").innerHTML += " <span style='color:#fdbaba;'>${pi.listCount}</span>";
			
			// 부서- none
			const arr3 = document.getElementsByClassName("menu3");
			for(let i=0; i<arr3.length; i++){
	        	arr3[i].style = 'display:none';
			}
			
			// 승인필요 block
			document.getElementById("switch-area").style = 'display:block';
			
			// 각 행
			const tr = document.getElementsByClassName("trOver");
			for(let i=0; i<tr.length; i++){
				// 삭제버튼 mouseover
				tr[i].addEventListener("mouseover", function(){
					const writer = this.childNodes[3].childNodes[1].childNodes[1].innerHTML;
					const btn = this.childNodes[3].childNodes[1].childNodes[3]
					if(writer == '${loginUser.userName}'){
						btn.style = 'position:absolute; top:-4px; left:25px; display:block;';
					}
				});
				tr[i].addEventListener("mouseout", function(){
					const writer = this.childNodes[3].childNodes[1].childNodes[1].innerHTML;
					const btn = this.childNodes[3].childNodes[1].childNodes[3]
					if(writer == '${loginUser.userName}'){
						btn.style = 'position:absolute; top:-4px; left:25px; display:none;';
					}
				});

				// 상세 onclick
				tr[i].childNodes[7].addEventListener("click", function(){
					const no = this.parentNode.childNodes[1].value;
					const form = this.parentNode.childNodes[5].innerHTML;
					location.href="detail.ap?no=" + no + "&form=" + form;
				});
			}
		}
		
		// Ajax 승인필요 select
		function switchBox(){
			const stch = document.getElementById("switch1")
			if(stch.checked == true){ // 승인필요가 checked인 경우
				$.ajax({
					url:'agreeList.ap?agr=1',
					success:function(map){
						const result = document.getElementById("ajaxResult");
						let arr = "";
						if(map.agreePi.listCount == 0){
							arr +=	"<tr>"
								+		"<td colspan='7'>나의 승인이 필요한 문서가 없습니다</td>"
								+	"</tr>";
						}else{
							for(let i=0; i<map.agreeList.length; i++){
								arr +=	"<tr>"
									+		"<td>" + map.agreeList[i].userName + "</td>"
									+		"<td>" + map.agreeList[i].form + "</td>"
									+		"<td>" + map.agreeList[i].title + "</td>"
									+		"<td>";
								if(map.agreeList[i].originName != null){
									arr +=		"<img src='resources/icons/clip.png' height='20px'>";
								}
								arr +=		"</td>"
									+		"<td>";
								if(map.agreeList[i].currentOrder == 0){
									arr +=		"<span class='stt-gr'>" + map.agreeList[i].approvalStatus + "</span>";
								}else{
									arr +=		"<span class='stt-pp'>" + map.agreeList[i].approvalStatus + " " +  + map.agreeList[i].currentOrder + "/" +  + map.agreeList[i].finalOrder + "</span>";
								}
								arr +=		"</td>"
									+		"<td>" + map.agreeList[i].createDate + "</td>"
									+		"<td>";
								if(map.agreeList[i].bookmark != null){
									arr +=		"<img src='resources/icons/star-y.png' height='20px'>";
								}else{
									arr +=		"<img src='resources/icons/star.png' height='20px'>";
								}
								arr +=		"</td>"
									+	"</tr>";
							}
						}
						result.innerHTML = arr;
					}, error:function(){
						console.log("승인필요용 ajax통신 실패");
					}
				});
			}else{ // 승인필요가 checked가 아닌 경우
				location.href="list.ap?myi=1";
			}
		}
		
		// Ajax 중요 update
		function ajaxStar(bk){
			const el = window.event.target;
			const no = el.parentNode.parentNode.childNodes[1].value;
			$.ajax({
				url:"updateBook.ap",
				data:{
					approvalNo:no,
					bookmark:bk,
					userName:${loginUser.userNo}
				},
				success:function(result){
					if(result > 0){
						location.reload();
					}
				}, error:function(){
					console.log("중요용 ajax통신 실패");
				}
			});
		}
		
		// Ajax 삭제 update
		function del(){
			if(confirm('결재문서를 삭제하시겠습니까?')){
				const el = window.event.target;
				const no = el.parentNode.parentNode.parentNode.childNodes[1].value;
				$.ajax({
					url:"deleteApproval.ap?no=" + no,
					success:function(result){
						if(result > 0){
							location.reload();
						}
					}
				});
			}
		}
	</script>
	
	<div class="content-2">
        <table id="tb" class="table-hover">
            <thead>
                <tr class="purple">
                    <th width="100px">작성자</th>
                    <th width="200px">문서양식</th>
                    <th>제목</th>
                    <th width="70px">첨부</th>
                    <th width="150px">결재상태</th>
                    <th width="150px">작성일</th>
                    <th width="70px">중요</th>
                </tr>
            </thead>
            <tbody id="ajaxResult">
                
                <c:choose>
                	<c:when test="${ empty list }">
                		<tr>
                			<td colspan="7">진행중인 문서가 없습니다.</td>
                		</tr>
                	</c:when>
                	<c:otherwise>
		                <c:forEach var="a" items="${ list }">
			                <tr class="trOver">
								<input type="hidden" name="approvalNo" value="${ a.approvalNo }">
			                    <td>
			                    	<div style="position:relative;">
			                    		<span>${ a.userName }</span>
				                    	<div class="btnn-rd" style="position:absolute; top:-4px; left:25px; display:none;" onclick="return del();">삭제</div>
				                    </div>
			                    </td>
			                    <td>${ a.form }</td>
			                    <td class="titleTd">${ a.title }</td>
			                    <td>
			                    	<c:if test="${ not empty a.originName }">
			                    		<img src="resources/icons/clip.png" height="20px">
			                    	</c:if>
			                    </td>
			                    <td>
			                    	<c:choose>
			                    		<c:when test="${ a.currentOrder eq 0 }">
			                    			<span class="stt-gr">${ a.approvalStatus }</span>
			                    		</c:when>
			                    		<c:otherwise>
			                    			<span class="stt-pp">${ a.approvalStatus} ${ a.currentOrder }/${ a.finalOrder }</span>
			                    		</c:otherwise>
			                    	</c:choose>
			                    </td>
			                    <td>${ a.createDate }</td>
			                    <td>
			                    	<c:choose>
			                    		<c:when test="${ empty a.bookmark }">
			                    			<img src="resources/icons/star.png" height="20px" class="as" onclick="ajaxStar(0);">
			                    		</c:when>
			                    		<c:otherwise>
				                    		<img src="resources/icons/star-y.png" height="20px" class="as" onclick="ajaxStar(1);">
			                    		</c:otherwise>
			                    	</c:choose>
			                    </td>
			                </tr>
		                </c:forEach>
		            </c:otherwise>
                </c:choose>
                
            </tbody>
        </table>
        
        <br>

        <div align="center">
        	<c:if test="${ pi.currentPage ne 1 }">
            	<a href="list.ap?myi=1&cpage=${ pi.currentPage - 1 }" class="btnn-pp">이전</a>
            </c:if>
            
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:choose>
					<c:when test="${ p eq pi.currentPage }">
						<a href="list.ap?a=1&cpage=${ p }" class="btnn-pp" style="background-color:#6F50F8; color:white;">${ p }</a>
					</c:when>
					<c:otherwise>
						<a href="list.ap?a=1&cpage=${ p }" class="btnn-pp">${ p }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<c:if test="${ pi.currentPage ne pi.maxPage and pi.maxPage ne 0 }">
            	<a href="list.ap?myi=1&cpage=${ pi.currentPage + 1 }" class="btnn-pp">다음</a>
            </c:if>
        </div>
    </div>
</div> <!-- div 닫는 구문 하나 더 있음 -->
</body>
</html>