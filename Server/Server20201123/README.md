# 목차

- [목차](#목차)
- [1. 서블릿](#1-서블릿)
  - [1.1. 서블릿 기본 골격](#11-서블릿-기본-골격)
    - [1.1.1. HttpServletRequest](#111-httpservletrequest)
    - [1.1.2. HttpServletResponse](#112-httpservletresponse)
    - [1.1.3. 서블릿 라이프 사이클](#113-서블릿-라이프-사이클)
    - [1.1.3. 서블릿 작성 시 유의사항](#113-서블릿-작성-시-유의사항)
  - [2.1 디렉티브](#21-디렉티브)
  - [2.2. 스크립트 요소](#22-스크립트-요소)
    - [2.2.1. 표현식](#221-표현식)
    - [2.2.2. 스크립틀릿](#222-스크립틀릿)
    - [2.2.3. 선언부](#223-선언부)
  - [2.3. 기본 객체](#23-기본-객체)
- [3. Todo 앱 완성시켜보기 (Servlet 으로 하는거)](#3-todo-앱-완성시켜보기-servlet-으로-하는거)
  - [3.1. todo 등록 페이지 (index.jsp)](#31-todo-등록-페이지-indexjsp)
  - [3.2. todo 등록 요청 받는 서블릿(혹은 jsp)](#32-todo-등록-요청-받는-서블릿혹은-jsp)
  - [3.3. todo리스트 출력 페이지 (todolist.jsp)](#33-todo리스트-출력-페이지-todolistjsp)

# 1. 서블릿

서블릿은 Java EE 스펙, 이것을 구현한 구현체가 tomcat, undertow, jetty

웹 서버 (Web Server)

- 스태틱 파일 서빙
- 로드 밸런싱
- 리버스 프록시

웹 애플리케이션 서버 (Web Application Server)

- 비즈니스 로직

서블릿 구현체를 서블릿 컨테이너(Servlet Container) 라고 부르고 그 구현체로

- tomcat
- undertow
- jetty
- 등등

## 1.1. 서블릿 기본 골격

``` java
/* 경로로 들어오면 get으로 들어오면 doGet로직이 돌아가고
 * post로 들어오면 doPost로 들어감
*/
@WebServlet("/path")  // 경로
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     * 서블릿 생성자
     */
    public HelloServlet() {
        super();
    }

  // WebServlet에 지정된 경로로 GET 메서드로 요청 시 처리할 로직
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

  // WebServlet에 지정된 경로로 POST 메서드로 요청 시 처리할 로직
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
\
```

### 1.1.1. HttpServletRequest

HTTP 요청에 대한 객체

- 요청 라인
  - 메서드
  - URI
  - 프로토콜
- 요청 해더
- 요청 바디

### 1.1.2. HttpServletResponse 

응답할 때 만들어준 객체

- 상태라인(status line)
  - 상태코드(status code)
- 응답 헤더
- 응답 바디

### 1.1.3. 서블릿 라이프 사이클

- init : 최초에 단 한 번만 실행됨
- service : 요청과 응답을 처리
- destory : 메모리에서 해제 될 때 호출
  - 내용이 변경되어 컨텍스트 다시 로드 할 때 
  - 서버 재시동
  - 서버 종료

### 1.1.3. 서블릿 작성 시 유의사항

- 서블릿은 싱글톤임
  - 파괴되기 전 까지 남아 있음
  - 상태를 가지면 사이드 이펙트 발생 가능성 존재
    - 가급적 멤버 변수 두지 말 것!

2. # JSP

자바 코드를  html 내에서 실행 가능하다.

JSP 기본 코드 구조

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>으악!!!!!!</title>
</head>
<body>
<%
	final Date date = new Date();
	final SimpleDateFormat sdf 
	= new SimpleDateFormat("yyyy-MM-dd hh:mm:ss(E)");
%>
	<h1>._.</h1>
	<p>현재 시간: <%= sdf.format(date) %></p>
</body>
</html>
```

```jsp
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>으악!!!!!!</title>
</head>
<body>
<%
	final Date date = new Date();
	final SimpleDateFormat sdf 
		= new SimpleDateFormat("yyyy-MM-dd hh:mm:ss(E)");
%>

<%!
//선언부 
	private String printDate(){
		final Date date = new Date();
		final SimpleDateFormat sdf 
			= new SimpleDateFormat("yyyy-MM-dd hh:mm:ss(E)");
		
		return sdf.format(date);
	}
%>
	<h1>._.</h1>
	<p>현재 시간: <%= sdf.format(date) %></p> <!-- 여기는 세미콜론 안붙힘 -->
	
	<p> 현재 시간 : <%= printDate() %>
</body>
</html>
```

위 코드는 크게 세 가지 부분으로 나뉨

1. 디렉티브(directive)
2. 스크립트 요소 (Scriptlet, Expression)
3. HTML

## 2.1 디렉티브

` <%@` 와 `%>` 로 둘러 쌓인 코드가 디렉티브
위 코드에서 디렉티브는 다음과 같다.

```jsp

```

기본적인 사용 방법

```jsp

```

디렉티브는 해당 JSP의 설정 정보를 지정한다.(이 페이지에 대한 정보 지정)

- page : 해당 페이지에 대한 필요한 정보 지정. 자바 임포트, 응답 버퍼 사이즈, 문서 타입
- taglib : 해당 페이지에서 사용 할 태그 라이브러리 지정 (대표적으로는 JSTL)
- include : 다른 문서 임포트 할 때

## 2.2. 스크립트 요소

JSP 페이지 내에서 동적으로 생성되는 내용들을 위해 존재함.

- 표현식(Expression) : 값을 출력. 정확히 값만 출력함.
- 스크립틀릿(Scriptlet) : 자바 코드 실행 ( `<% 자바코드 %>`)
- 선언부(Declaration) : 자바 메서드를 페이지 내에 선언

### 2.2.1. 표현식

`<%=` 와 `>`로 감싼 값으로 평가 되는 식

### 2.2.2. 스크립틀릿

```jsp
<%
	final Date date = new Date();
	final SimpleDateFormat sdf 
	= new SimpleDateFormat("yyyy-MM-dd hh:mm:ss(E)");
%>
```

### 2.2.3. 선언부

메서드를 선언할 수 있다. (여기서 생성된 메서드는 현재 페이지를 만들기 위한 객체로 소속됨.)

```jsp
<%!
	private String printDate(){
		final Date date = new Date();
		final SimpleDateFormat sdf 
			= new SimpleDateFormat("yyyy-MM-dd hh:mm:ss(E)");
		return sdf.format(date);
	}
%>
```

## 2.3. 기본 객체

- request(HttpServletRequest) : HTTP 요청에 대한 객체
- response(HttpServletResponse) : HTTP 응답에 대한 객체. 응답 결과 가공 후 전송. 
- session(HttpSession) : 세션
- application : 현재 애플리케이션(톰켓)의 정보
- pageContext : 현재 페이지 구성에 대한 컨텍스트 


표현식을 더 간단 하게 사용하는 법.
```jsp
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>으악!!!!!!</title>
</head>
<body>
<%!
    private long factorial(ling n){
        long result = 1;
        while (n >= 1){
            result *= n--;
        }
        return result;
    }
%>

<%
    // /path?n=10 일 때 n에 10이 존재하면 n출력 아니면 1출력.
    String nValue = request.getParameter("n");
    String n = Optional.ofNullable(request.getParameter("n")).orElse("1");
    long result = factorial(Long.valueOf(n));
%>
    <h1>._.</h1>
    결과 : <%= result %>

</body>
</html>
```

form 사용
```jsp
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>으악!!!!!!</title>
</head>
<body>
    <form action= "todo.jsp" method="post">
        <label for="whattode"> 할 일 : </label>
        <input type="text" id="whattode" name="whattode"/>
        <label for="whattode"> 이름 : </label>
        <input type="text" id="myname" name="myname"/>
        <input type="summit"/>
    </form>
</body>
</html>
```

<!-- jsp는 html 태그 내에서 자바를 사용 할 수 있음, 서블릿은 그렇지 않다 -->
# 3. Todo 앱 완성시켜보기 (Servlet 으로 하는거)
Todo.java
```java
package kr.or.iei;

public class Todo {
    private final String whatToDo;
    private final String myName;

    public Todo(String whatToDo, String myName) {
        this.whatToDo = whatToDo;
        this.myName = myName;
    }

    public String getWhatToDo() {
        return whatToDo;
    }

    public String getMyName() {
        return myName;
    }

    @Override
    public String toString() {
        return "Todo{" +
                "whatToDo='" + whatToDo + '\'' +
                ", myName='" + myName + '\'' +
                '}';
    }
}

```

TodoRepository.java
```java
package kr.or.iei;

import java.util.ArrayList;
import java.util.List;

public class TodoRepository {

    private static final TodoRepository INSTANCE = new TodoRepository();
    private final List<Todo> todoList = new ArrayList<>();

    private TodoRepository() {
    }

    public static TodoRepository getInstance() {
        return INSTANCE;
    }

    public void saveTodo(Todo todo) {
        todoList.add(todo);
    }

    public List<Todo> getTodoList() {
        return todoList;
    }
}

```


## 3.1. todo 등록 페이지 (index.jsp)

```jsp

```

## 3.2. todo 등록 요청 받는 서블릿(혹은 jsp)
  - form 태그에서 action 이름 유의하기.

```jsp

```
## 3.3. todo리스트 출력 페이지 (todolist.jsp)

```jsp

```
