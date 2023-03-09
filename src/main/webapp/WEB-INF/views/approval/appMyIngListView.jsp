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
				const arr = document.getElementsByClassName("menu1");
				for(let i=0; i<arr.length; i++){
		        	arr[i].style = 'display:none';
				}
			});
			m2.addEventListener("mouseover", function(){
				const arr = document.getElementsByClassName("menu2");
				for(let i=0; i<arr.length; i++){
		        	arr[i].style = 'display:none';
				}
			});
			m2.addEventListener("mouseout", function(){
				const arr = document.getElementsByClassName("menu1");
				for(let i=0; i<arr.length; i++){
		        	arr[i].style = 'display:block';
				}
			});
			m2.addEventListener("mouseout", function(){
				const arr = document.getElementsByClassName("menu2");
				for(let i=0; i<arr.length; i++){
		        	arr[i].style = 'display:block';
				}
			});
			
			// 참조 mouseover
			const m12 = document.getElementById("menu-1-2")
			m12.addEventListener("mouseover", function(){
				const arr = document.getElementsByClassName("menu2");
				for(let i=0; i<arr.length; i++){
		        	arr[i].style = 'display:none';
				}
			});
			m12.addEventListener("mouseout", function(){
				const arr = document.getElementsByClassName("menu2");
				for(let i=0; i<arr.length; i++){
		        	arr[i].style = 'display:block';
				}
			});
			
			// 중요 mouseover
			const m13 = document.getElementById("menu-1-3")
			m13.addEventListener("mouseover", function(){
				const arr = document.getElementsByClassName("menu2");
				for(let i=0; i<arr.length; i++){
		        	arr[i].style = 'display:none';
				}
			});
			m13.addEventListener("mouseout", function(){
				const arr = document.getElementsByClassName("menu2");
				for(let i=0; i<arr.length; i++){
		        	arr[i].style = 'display:block';
				}
			});
			
			// 개인-기안-진행중 black
			document.getElementById("menu-1").style = 'color:black; font-weight:600';
			document.getElementById("menu-1-1").style = 'color:black; font-weight:600';
			document.getElementById("menu-1-1-1").style = 'color:black; font-weight:600';
			
			// 부서- none
			const arr = document.getElementsByClassName("menu3");
			for(let i=0; i<arr.length; i++){
	        	arr[i].style = 'display:none';
			}
			
			// 승인필요 block
			document.getElementById("switch-area").style = 'display:block';
		}
	</script>
	
	<div class="content-2">
        <table id="tb" class="table-hover">
            <thead>
                <tr class="purple">
                    <th width="30px"><input type="checkbox"></th>
                    <th>작성자</th>
                    <th>문서양식</th>
                    <th>제목</th>
                    <th>첨부</th>
                    <th>결재상태</th>
                    <th>작성일</th>
                    <th>중요</th>
                </tr>
            </thead>
            <tbody>
                <!-- forEach -->
                <tr>
                    <td><input type="checkbox"></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>

            </tbody>
        </table>
        
        <div class="del-btn-area"><button class="btnn-rd">선택 문서 삭제</button></div>
        <br clear="both">

        <div align="center">
            <a href="" class="btnn-pp">이전</a>
            <!-- forEach -->
            <a href="" class="btnn-pp">1</a>

            <a href="" class="btnn-pp">다음</a>
        </div>
    </div>
</div> <!-- div 닫는 구문 하나 더 있음 -->
</body>
</html>