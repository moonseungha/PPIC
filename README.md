## PPIC
- 그룹웨어 웹 서비스


***
## Contents <br>
1. [개요](#star-개요)
2. [팀 소개 및 담당 기능](#star-팀-소개-및-담당-기능)
3. [구현 기능](#star-구현-기능)
   - [전자결재 작성](#pushpin-전자결재-작성)
   - [전자결재 문서함](#pushpin-전자결재-문서함)
   - [전자결재 다중 조건 검색](#pushpin-전자결재-다중-조건-검색)
   - [전자결재 상세_승인_반려_댓글](#pushpin-전자결재-상세_승인_반려_댓글)
   - [전자결재 수정](#pushpin-전자결재-수정)
   - [전자결재 삭제_전체 문서 관리_삭제 문서 관리](#pushpin-전자결재-삭제_전체-문서-관리_삭제-문서-관리)
4. [설계](#star-설계)
   - [WBS](WBS)
   - [UseCase Diagram](UseCase-Diagram)
   - [ERD](ERD)


***
## :star: 개요
- 개발기간
  - 2023-02-13 ~ 2023-03-29 (6주)
  - 분석 및 설계 (3주) + 개발 (3주)
- 보고서
  - [최종보고서_삑카츄_PPIC.pdf](https://github.com/moonseungha/PPIC/files/11269303/_._PPIC.pdf)
- 기획의도
  - 회사의 업무 환경을 디지털화하여 시공간에 제약없이 원격 근무가 가능하게 하고자 하였음
  - 대규모 자료 처리 및 구성원간의 원활한 정보 공유를 통해 기업의 업무생산성을 향상시키고자 하였음
- 개발환경
  - HTML5 / CSS3 / JavaScript / JQuery / Ajax
  - Java (JDK 11) / Servlet / JSP / Oracle 11g / Apache Tomcat 9.0 / Spring Framework / Maven / Mybatis
  - Eclipse / Visual Studio Code / STS3


***
## :star: 팀 소개 및 담당 기능
- 구선화 - 문서, 업무, 문서 관리
- 문승하 - 전자결재, 전자결재 관리
- 박은지 - 사원 정보, 근태, 사원 관리, 근태 관리, 휴가 관리
- 신하영 - 로그인, 회원가입, 메일
- 윤예서 - 회사 소식, 메신저, 알림, 회사 소식 관리


***
## :star: 구현 기능

### :pushpin: 전자결재 작성
- 업무기안

![업무기안 작성](https://user-images.githubusercontent.com/115603472/233338985-dfaadf17-ddce-486b-9f16-a389c72d962c.gif)

```
승인자, 참조자 중복 불가
다중 첨부파일 구현
협조부서의 부서원이 결재선에 반드시 포함
```

- 인사발령품의서, 비품신청서, 지출결의서

![전자결재 작성](https://user-images.githubusercontent.com/115603472/233343347-aa517abc-ecaa-4516-ac5a-60cd077d8ee4.gif)

```
사원 추가 가능
행 추가 가능
```

📍승인자 / 참조자 / 사원 추가 구현

![image](https://user-images.githubusercontent.com/115603472/233342158-49f35fd8-220f-4a9a-a3a9-a021491db43a.png)
<br><br>

📍다중 첨부파일 구현

![image](https://user-images.githubusercontent.com/115603472/233342549-937c5cbf-6d75-494c-9d05-8921dd0c6be3.png)
<br><br>

📍결재선 등록 템플릿 구현

![image](https://user-images.githubusercontent.com/115603472/233342737-10342048-9bc8-4807-81bb-1da4ec8d5a1b.png)
<br><br>


### :pushpin: 전자결재 문서함
- 개인문서함__진행중_완료_임시저장_참조_중요

![개인부서함](https://user-images.githubusercontent.com/115603472/233268206-5bc618b1-89f6-4cec-b61a-f4527d285979.gif)

```
내가 기안한 문서일 경우 삭제버튼 display block
개인문서함 - 진행중, 승인필요, 완료, 임시저장, 참조, 중요 문서함 조회
```

- 부서문서함__진행중_완료

![부서문서함](https://user-images.githubusercontent.com/115603472/233268267-ef8fdf2d-76f0-4f3a-a3fc-f7542e5a14ba.gif)

```
부서문서함 - 진행중, 완료 문서함 회조회
```

📍문서함 조회 sql문

![image](https://user-images.githubusercontent.com/115603472/233349361-bc5c3f95-bdc3-4336-8f6f-426f2719179a.png)
<br><br>


### :pushpin: 전자결재 다중 조건 검색
![다중 조건 검색](https://user-images.githubusercontent.com/115603472/233268224-ccee3d27-b565-412e-99da-539f75be9294.gif)

```
작성자, 양식, 제목, 승인자, 참조자, 문서번호, 기간, 정렬 총 8개의 조건으로 구현
직접입력 radio 체크시에만 기간 설정 행 display block
검색 조건 상단에 노출
```
<br>


### :pushpin: 전자결재 상세_승인_반려_댓글
![상세 승인 반려 댓글](https://user-images.githubusercontent.com/115603472/233269241-08acd126-3377-4b7b-a5af-c28e9af312d5.gif)

```
승인 또는 반려시 댓글창에 변경사항 추가
댓글 입력, 삭제 가능
```

📍상세 조회 sql문

![image](https://user-images.githubusercontent.com/115603472/233349939-272e0dac-4b80-47b8-9dc1-58e68d5506ff.png)
<br><br>


### :pushpin: 전자결재 수정
![수정](https://user-images.githubusercontent.com/115603472/233269935-f7acef76-8b42-4a09-95e7-5415e0cb3604.gif)

```
수정시 기존정보 그대로 가져옴
첨부파일 수정 가능
```
<br>


### :pushpin: 전자결재 삭제_전체 문서 관리_삭제 문서 관리
![삭제 전체문서관리 삭제문서관리](https://user-images.githubusercontent.com/115603472/233268821-93af0df9-cf54-45af-9be3-94ac0fdb992b.gif)

```
삭제, 복원, 영구삭제 가능
```


***
## :star: 설계

### WBS
![image](https://user-images.githubusercontent.com/115603472/233281178-e76157d6-ad17-4dfc-b663-d44e97025ae7.png)

### UseCase Diagram
![image](https://user-images.githubusercontent.com/115603472/233281318-bbf1e6ad-40a3-41a9-b0d8-f04114712755.png)

### ERD
![image](https://user-images.githubusercontent.com/115603472/233281407-88c60039-6c71-4842-b582-ade81aa031fc.png)
