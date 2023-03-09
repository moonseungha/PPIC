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
			// 개인 mouseover
			const m1 = document.getElementById("menu-1")
			m1.addEventListener("mouseover", function(){
				const arr1 = document.getElementsByClassName("menu1");
				for(let i=0; i<arr1.length; i++){
		        	arr1[i].style = 'display:block';
				}
				const arr3 = document.getElementsByClassName("menu3");
				for(let i=0; i<arr3.length; i++){
		        	arr3[i].style = 'display:none';
				}
			});
			m1.addEventListener("mouseout", function(){
				const arr1 = document.getElementsByClassName("menu1");
				for(let i=0; i<arr1.length; i++){
		        	arr1[i].style = 'display:none';
				}
				const arr3 = document.getElementsByClassName("menu3");
				for(let i=0; i<arr3.length; i++){
		        	arr3[i].style = 'display:block';
				}
			});
			
			// 부서-진행중 black
			document.getElementById("menu-2").style = 'color:black; font-weight:600';
			document.getElementById("menu-2-1").style = 'color:black; font-weight:600';
			
			// 개인- none
			const arr1 = document.getElementsByClassName("menu1");
			for(let i=0; i<arr1.length; i++){
	        	arr1[i].style = 'display:none';
			}
			const arr2 = document.getElementsByClassName("menu2");
			for(let i=0; i<arr2.length; i++){
	        	arr2[i].style = 'display:none';
			}
			const arrm2 = document.getElementsByClassName("m2");
			for(let i=0; i<arrm2.length; i++){
	        	arrm2[i].style = 'margin-left: 19px';
			}
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
                </tr>

            </tbody>
        </table>
        <br>

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