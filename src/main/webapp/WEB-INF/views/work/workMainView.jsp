<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PPIC</title>
<style>
	<!-- 카테고리 css -->
	
	.workcategory{
	    width: 100%;
	    margin-bottom: 30px;
	}
	.workcategory>a{
	    font-size: 20px;
	    font-weight: bold;
	    margin-right: 20px;
	    color: lightgray;
	    text-decoration:none;
	}
	
	.workcategory>a:link {color:lightgray; text-decoration:none;}
    .workcategory>a:visited {color:lightgray; text-decoration:none;}
	.workcategory>a:hover{color: black; text-decoration:none;}
	
	.wotitle{
	    /* border: 1px solid black; */
	    height: 30px;
	    width: 100%;
	    font-size: 20px;
	    font-weight: bold;
	    margin-bottom: 20px;
	    margin-top: 40px;
	}
	
	.day{
	    border: 1px solid black;
	    padding: 30px 10px 5px 5px ;
	    font-size:18px;
	    width: 250px;
	    height: 250px;
	}
	
	.day>span{
		font-size:23px;
		font-weight: bold;
		
	}
	
	.day>table{
		font-size:23px;
		
	}
	
	#workstatus{
	    background: rgb(111, 80, 248);
	    color: white;
	    width: 60px;
	    font-size: 15px;
	    height: 30px;
	    border-radius: 2px;
	    padding-top: 3px;
	    margin-top: 15px;
	    margin-bottom: 15px;
	}
	
	.workinfod{
	    border: 1px solid black;
	    width: 30%;
	    margin-right: 30px;
	    font-size: 20px;
	    height:200px;
	}
	
	
	.worklist{
	    
	    margin: 100px 5px 5px 50px;
	}

</style>
</head>
<body>
	<!--  -->
	<jsp:include page="../common/menubar.jsp" />
	
	<div class="outer">


        <div id="content" style=" " >

			<div onclick="workback();">
				<h2 style="font-weight:bold">근무</h2>
				<br>
			</div>
           
           <div class="workcategory" style="float:left;" >
                <a href="workList.wo?no=${loginUser.userNo }" >출퇴근기록</a>
                <a href="workInfo.wo?no=${loginUser.userNo }" >올해근무정보</a>
				<a href="holiInfo.ho?no=${loginUser.userNo }" >휴가현황</a>
                <a href="holiApply.ho?no=${loginUser.userNo }">휴가신청</a>
                
                
                <!-- 관리자만 보이게 할거임 -->
                <a href="memberWork.wo">구성원근무</a>
                <a href="memberHoli.ho">전사원휴가현황</a>
                <a href="holiGive.ho">휴가지급|회수</a>
                <a href="holiApprove.ho">휴가승인</a>
                
                <br>
            </div>
            

            <br>
            
            <div class="workinfo" style="margin-top:30px;">
               <table style="float:left;">
                    <tr style="font-size: 20px;" >
                        <th height="50px" width="440px" >월근태현황</th>
                        <th width="445px">휴가현황</th>
                        <th width="300px">근무시간</th>
                    </tr>
               </table>

               <div class="workinfod" style="float:left; margin-top:10px">
                    <table align="center" style="margin-top:10px">
                        <tr align="center">
                            <td height="100px" width="100px"> 지각</td>
                            <td width="100px"> 조기퇴근 </td>
                            <td width="100px">결근</td>
                        </tr>
                        <tr align="center">
                            <td height="50px">${ w. behindtime}회</td>
                            <td>${w.leavearly}회</td>
                            <td>${w.absenteeism}회</td>
                        </tr>
                    </table>
               </div>

               <div class="workinfod" style="float:left; margin-top:10px;" >
                <table align="center" style="margin-top:10px" >
                    <tr align="center">
                        <td height="100px" width="100px"> 지급연차 </td>
                        <td width="100px"> 사용연차 </td>
                        <td width="100px"> 잔여연차 </td>
                       
                    </tr>
                    <tr align="center">
                        <td>${ m.giveDay + m.addDay }일</td>
                        <td>${ m.useDay }일</td>
                        <td>${ m.giveDay + m.addDay + m.useDay }</td>
                        
                    </tr>
                </table>
                </div>

                <div class="workinfod" style="float:left; margin-top:10px;" >
                    <table align="center" style="margin-top:10px">
                        <tr align="center">
                            <td height="100px" width="150px"> 추가근무</td>
                            <td width="150px"> 총 근무시간 </td>
                           
                        </tr>
                        <tr align="center">
                            <td height="50px">00회</td>
                            <td>00회</td>
                           
                        </tr>
                    </table>
               </div>



            </div>
            <br>

            <div class="wotitle" style="float:left;"> 출퇴근기록</div>
			
			<c:forEach var="list1" items="${ list1 }" end="4">
	            <div class="day"  align="center" style="float:left">
	                <span> ${list1.workDate }</span> <br>
	                <div id="workstatus"> ${list1.status } </div>
	               
	                
	                <table border="1" >
	                    <tr align="center">
	                        <td width="100px" >출근</td>
	                        <td width="100px" >${list1.workIn }</td>
	                    </tr>
	                    <tr align="center">
	                        <td >퇴근</td>
	                        <td>${list1.workOut }</td>
	                    </tr>
	                </table>
	            </div>
            </c:forEach>
           
            
            <div class="worklist" style="float:left" onclick="location.href='workList.wo?no=${loginUser.userNo }'"> 
                
                o o o  
            
            </div>
           

          
		</div>
        
	</div>
</body>
</html>