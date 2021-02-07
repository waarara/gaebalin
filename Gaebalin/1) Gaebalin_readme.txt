* 서버를 익스포트할 경우 오류가 자주 나서 다이나믹웹만 익스포트하므로 임포트해서 실행시킬때는 서버를
생성해주시기 바랍니다.
사진이 안나올 경우 서버 오버뷰에서 Modules를 클릭한 후 해당 디렉토리 경로를 기본 경로('/')로 해주시기 바랍니다.

1. 컴파일 실행 환경 = JAVA SDK 1.8, ORACLE 12c, TOMCAT 9.0 , eclipse IDE

2. 적용 기술 = Spring MVC, Mybatis, JAVA, JSP, HTML, CSS, BootStrap, Jquery(AJAX, JSON) , OracleDB

3. Oracle12c에 권한 부여
유저 생성을 위한 초기 설정
alter session set "_ORACLE_SCRIPT"=true;

3-1.유저 생성 및 권한 부여

CREATE USER gaebalin IDENTIFIED BY gaebalin;
  GRANT CONNECT, RESOURCE TO gaebalin;
  GRANT ALTER SESSION TO gaebalin;
  GRANT UNLIMITED TABLESPACE TO gaebalin;

3-2. SQL 구조에 수정이 생긴 경우 급한 경우가 아니라면 유저를 삭제했다가 다시 만들어서 권한을 주는게 좋음.

cmd창에서
sqlplus system/System1234
DROP USER gaebalin cascade;
CREATE USER gaebalin IDENTIFIED BY gaebalin;
GRANT CONNECT, RESOURCE TO gaebalin;
GRANT ALTER SESSION TO gaebalin;
GRANT UNLIMITED TABLESPACE TO gaebalin;


(12c버전일 경우해줘야함)
grant unlimited tablespace to gaebalin;

(12c버전일 경우 유저삭제 안되거나 생성 안되면)
ALTER SESSION SET "_ORACLE_SCRIPT"=true; 

하고 다시하면됌

4. gaebalin.sql파일의 쿼리들을 gaebalin/gaebalin 계정에 모두 commit 해야함

7. 회원 이미지 경로.

   workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\gaebalin\userImg

   => 이미지는 서버에 업로드되어 있습니다.(refresh 문제 해결)

   => 로컬에서는 확인할 수 없습니다 (기존 샘플데이터는 확인가능함)

8. 공통스크립트 파일 = common.js (index.html 수정해서 실행)

9. Login

   1) 관리자(A) 접속 = 아이디 : admin, 비밀번호 : admin

   2) 일반유저 접속 = 아이디 : user, 비밀번호 : user

   3) 그외 TB_COM_USER 테이블에서 조회하여 접속하시면 됩니다.

   4) 샘플 유저정보는 SQL 쿼리파일에 있습니다.


10. 개발자 커뮤니티 개발인 WebSite 주요기능 및 기술

   1) 공통

     ① 로그인(ID찾기, 패스워드찾기) / 로그아웃
    
     ② 회원가입, 회원정보 수정
  
     ③ 데이터 검색 및 페이징(BootStrap 테이블이용)

   2) 사용자

     ① 제품구매(바로구매, 장바구니)

     ② 제품구매 후 주문서확인

     ③ 제품구매 후 댓글등록 및 삭제(모바일 형식의 댓글 UI), 평점등록(별모양 UI 사용)

     ④ 구매내역

     ⑤ 장바구니(장바구니에서 바로구매 기능, 리스트 삭제기능)

   3) 관리자

     ① 재고관리(새로운 제품 등록 및 수정)

     ② 매출통계(제품 카테고리별, 항목별 매출 통계)

     ③ 재고현황(카테고리별 재고현황, 제품 판매현황 통계)

11. 개발인 프로그램 구조 Description

  1) 기본 프레임워크는 Spring이며, Tomcat, OracleDB 등을 사용합니다.

  2) JAVA (Controller, Service, ServiceImpl, Bean) + xml(mybatis)로 Set 구성
 
  3) 화면단은 JSP(BootStrap 이용)

  4) Sciprt는 jQuery 다수 적용

  5) 입력단 validation 체크 : 공통(common.js), 소스분석참고

    [입력단 validation은 화면마다 한줄처리로 가능하게 만들었음]

12. common.js(jquery구현) 주요기능

  1) 입력단 뒤로가기 버튼 방지

  2) 로그인체크

  3) validation자동체크(백그라운드에 애니메이션 효과(red))

  4) 입력단 필수값표시(required속성이용(HTML5)) 앞단에 빨간*표시

  5) 숫자 입력단에 숫자이외 타이핑 금지

13. 주요기술 

  1) 비동기 사진 업로드

  2) 비동기 JSON  처리

  3) 크롤링 페이지 : 장고 서버를 이용

  4) 딥러닝 이미지 분류 페이지 : 플라스크 서버를 이용