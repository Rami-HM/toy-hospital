# toy-hospital


--------------------------프로젝트 실행 방법----------------------------------------------------------

1. DataBase 계정 - ID : hospital / PW : 1234
2. hospital 계정 생성 후 SqlDeveloper 에 '초기데이터.sql', 'pakage.sql' 파일 Open 후 코드 실행
3. zipcode.cvs 파일을 데이터 임포트를 통해 테이블(ZIPCODE) 생성
4. Hospital.zip 압축 해제 후 Ecilpse 에서 import 
5. Tomcat9.0 Server 생성 
6. 프로젝트 우클릭 -> Run as -> Run On Server
	* 필요에 따라 bulid-path 설정 

---------------------------------------------------------------------------------------------------------
	* views - echo.jsp
	 34번째 줄 : var webSocket = new WebSocket('ws://192.168.1.169:9090/broadcasting');
		: (192.168.1.169:9090)를 서버 (IP:포트번호)로 변경 해주어야 함
			* localhost로 변경시 채팅이 원활하지 않을 수 있음.
