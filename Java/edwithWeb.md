## Servlet
### Servlet Life Cycle
init(), service(), destroy()

- 서버가 url 요청에 응답하는 방법
1. url에 mapping 된 servlet이름, 그 class 이름을 찾는다
2. 메모리에 해당 servlet 객체가 존재하지 않을 경우, 새로 생성한 뒤, init() 호출
3. 메모리에 해당 객체 존재할 경우, service() 를 호출한다
4. was 서버가 종료되거나, 웹 어플리케이션이 새로 갱신되면 destroy()가 호출됨.

- 새로고침을 할 경우, 이미 해당 객체가 존재하니까 service()만 호출 될 것
	- 새로고침 == request 

- 정리
	- was가 서블릿 요청을 받으면, 해당 서블릿이 메모리에 있는지 확인
	- if(메모리에 있음) 해당 서블릿 클래스를 메모리에 올리고, init() 실행
	- service() 실행
	- was 서버가 종료되거나, 웹 어플리케이션이 새로 갱신되면 destroy() 메소드 실행

![
](https://cphinf.pstatic.net/mooc/20180124_22/1516782982944xjogH_PNG/1_5_3_ServletLifcycle.PNG)

**service(request, response) 메소드**

HttpServlet의 service메소드는 템플릿 메소드 패턴으로 구현합니다.

-   클라이언트의 요청이 GET일 경우에는 자신이 가지고 있는 doGet(request, response)메소드를 호출
-   클라이언트의 요청이 Post일 경우에는 자신이 가지고 있는 doPost(request, response)를 호출
