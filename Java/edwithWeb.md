## Servlet
### Servlet Life Cycle
***init(), service(), destroy()***

- 서버가 url 요청에 응답하는 방법
1. url에 mapping 된 servlet이름, 그 class 이름을 찾는다
	- annotation / xml 방식으로 url-servlet mapping 
3. **메모리에 해당 servlet 객체가 존재하지 않을 경우**, 새로 생성한 뒤, ***init()*** 호출
4. 메모리에 해당 객체 존재할 경우, ***service()*** 를 호출한다
5. was 서버가 종료되거나, 웹 어플리케이션이 새로 갱신되면 ***destroy()*** 가 호출됨.

- 새로고침을 할 경우, 이미 이전 요청에서 쓴 해당 객체가 존재하니까 service()만 호출 될 것          
	- 새로고침 == request 

- 정리
	- was가 서블릿 요청을 받으면, 해당 서블릿이 메모리에 있는지 확인
	- if(메모리에 있음) 해당 서블릿 클래스를 메모리에 올리고, init() 실행
	- service() 실행
	- was 서버가 종료되거나, 웹 어플리케이션이 새로 갱신되면 destroy() 메소드 실행

![
](https://cphinf.pstatic.net/mooc/20180124_22/1516782982944xjogH_PNG/1_5_3_ServletLifcycle.PNG)

**service(request, response) 메소드**

***HttpServlet*** 의 service메소드는 템플릿 메소드 패턴으로 구현합니다.

-   클라이언트의 요청이 ***GET*** 일 경우에는 자신이 가지고 있는 ***doGet(request, response)***메소드를 호출
-   클라이언트의 요청이 ***POST*** 일 경우에는 자신이 가지고 있는 ***doPost(request, response)***를 호출
## Redirect
- http 프로토콜로 정해진 규칙
- 서버는 클라이언트의 요청에 대해 특정 url로 이동을 요청할 수 있다
![redirect 과정](https://cphinf.pstatic.net/mooc/20180127_5/1517046342330PRbSX_PNG/2_4_1_redirect__.PNG)

과정
1. 클라이언트가 redirect01.jsp 요청
2. 서버가 그 요청에 대해 http ***상태코드 302*** 로 응답
	- response header 안에 location 값은 이동할 url
3. 클라이언트는 response header 안 ***location*** 값에 있는 url로 재요청을 보냄 => 브라우저 주소도 새 url로 바뀜
4. 서버가 재요청에 대한 응답을 함

- redirect : total 2 request, 2 response
- 개발자도구 - **network 탭**에서 응답코드(302) 확인 가능

## Forward 
한 servlet/jsp에서 요청 처리하다가, 다른 servlet/jsp에게 추가적인 처리를 위임하는 것
- 과정
1. 클라이언트가 serlvet1에 요청 보냄
2. servlet1은 요청 처리 후에 결과를 ***HttpServletRequest*** (request) 에 저장
3. servlet1은 추가 처리를 위해 servlet2로 request, response 객체를  forward
4. servlet2는 forward된 request, response를 받아 추가 처리 후 클라이언트에게 응답

- request : ***HttpServletRequest***
- response: ***HttpServletResponse***

**client** --request--> **servlet1** --forward--> **servlet2** --response--> **client**

```java
//servlet 안의 service method

protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            
            //처리....
            
            //처리 결과 request에 저장
            request.setAttribute("name", value);
            
            // forward 할 url 설정
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/next");
            
            //forward
            requestDispatcher.forward(request, response);
    }

```
## Scope
- 변수가 유지되는 범위
- 4가지 Scope (범위가 더 큰 순서대로)
	- Application : 웹 어플리케이션 시작~ 종료까지 유지됨
	- Session : 웹 브라우저별로 변수가 관리되는 경우 사용
	- Request : http 요청을 WAS가 받아 요청할 때까지 유지됨
	- Page : page 내 지역변수처럼 사용

### Page Scope
- ***PageContext*** 추상 클래스를 사용한다
- 이 클래스 안에 Page scope 관련 변수가 다 有
- JSP 페이지에서는 ***pageContext*** 라는 내장객체로 사용 가능
- forward가 되면 해당 page scope에 지정된 변수는 사용 불가
	- forward : 다른 page로 request를 넘김 == 다른 page는 다른 page scope을 보유
- 다른 scope과 다른점 : 마치 **지역변수처럼** 사용됨
	- 해당 jsp/servlet 이 실행되는 동안에만 정보 유지하고자 할 때 사용
- jsp에서 page scope에 값 저장한 후, **EL표기법** 등에서 사용할 때 사용됨

### Request Scope
- 웹브라우저 --- **request** --> WAS
받은 후에, 
**포워드 되는 동안 유지하고 싶은 정보가 있을 경우**
request scope을 사용
- response되기 까지 유지하고 싶은 값이 있다면 사용
- ***HttpServletRequest***(request) 객체 사용
	- JSP - ***request*** 내장 변수 사용
- 값 저장 & 읽기
	- ***setAttribute(String name, Object o)***
	-	***getAttribute(String name)***
- forward 하면, page만 변하지 아직 응답 안했으니, **request는 그대로 유지됨**
- **redirect** 의 경우엔 새로운 요청을 만들어 재요청하는 것임 == **request scope 유지 불가능**

### Session Scope
- 접속한 **웹 브라우저별로** 정보를 관리하고 싶을 때 사용
- 웹 브라우저의 탭들은 서로 세션정보가 공유됨 => 같은 세션 정보를 사용 가능
- HttpSession 인터페이스를 구현한 객체를 사용
	- JSP - ***session*** 내장변수 사용
	- Servlet - ***request.getSession()*** 으로 session객체 얻는다
- session에 값 저장하고 읽어오기
	- ***setAttribute()***
	- ***getAttribute()***
- ex.) 장바구니처럼 사용자별로 유지가 되어야 할 정보가 있을 때 사용	

### Application Scope
- 웹어플리케이션 시작~ 종료전 까지 사용가능한 변수 범위
- **모든 클라이언트가 공통으로 사용해야 할 값이 있을 때** 사용
- ***ServletContext*** interface를 구현한 객체를 사용
	- JSP - ***application*** 내장객체
	- Servlet - ***getServletContext()*** 로 application객체를 받아 사용 (***HttpServlet*** 의 메소드)
- 웹 어플리케이션 하나 당, 하나의 application 객체가 사용됨
- 값 저장과 읽기
	- ***setAttribute()***
	- ***getAttribute()***

## JSP 문법
- JSP는 Servlet으로 변환되어 WAS에서 실행된다.
- **선언문** **<%! %>**
	- 전역변수 선언 및 메소드 선언에 사용
- **<% %>**
	- 프로그램 코드 기술에 사용

- **변수 선언에 있어 차이점**
	- **<% %>** 안에서 선언한 변수:  ***_jspService()*** 메소드 안의 지역변수
	- **<%! %>** 안에서 선언한 변수: Servlet 객체의 멤버 변수나 메소드 (전역변수-JSP 전체에서 참조 가능)

## JSP 내장객체
- ***_jspService()*** 의 메소드 안에 미리 선언된 객체
- Servlet 코드로 변환시 자동으로 해당 메소드 안에 들어있음
- 내장객체 종류
![내장 객체의 종류](https://cphinf.pstatic.net/mooc/20180130_74/1517275973733EL11k_PNG/2_3_4_jsp_.PNG)

## EL (Expression Language) for JSP
- 값을 표현하는데 사용되는 스크립트 언어
- JSP의 기본문법 보완하는 역할

## JSTL(JSP Standard Tag Library)
