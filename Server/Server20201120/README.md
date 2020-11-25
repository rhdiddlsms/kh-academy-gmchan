# 목차

- [목차](#목차)
- [1. 요약](#1-요약)
  - [1.1. 블로킹](#11-블로킹)
  - [1.2. 스레드](#12-스레드)
  - [1.3. IO](#13-io)
  - [1.4. 소켓(자바 소켓)](#14-소켓자바-소켓)
    - [1.4.1. 서버 - ServerSocket](#141-서버---serversocket)
    - [1.4.2. 클라이언트 - Socket](#142-클라이언트---socket)
- [2. HTTP](#2-http)
  - [2.1. HTTP Message](#21-http-message)
    - [2.1.1. 시작라인(start-line)](#211-시작라인start-line)
    - [2.1.2. 메세지 헤더 (message header)](#212-메세지-헤더-message-header)
    - [2.1.3. 메세지 바디 (message body)](#213-메세지-바디-message-body)
  - [2.2. 요청(Request)](#22-요청request)
    - [2.2.1. 요청라인(request line)](#221-요청라인request-line)
    - [2.2.2. 요청 헤더(메세지 헤더)](#222-요청-헤더메세지-헤더)
    - [2.2.3. 메세지 바디](#223-메세지-바디)
  - [2.3. 응답  //요청이랑 비슷](#23-응답--요청이랑-비슷)
    - [2.3.1. 상태라인](#231-상태라인)
  - [2.4. HTTP 프로토콜 특징](#24-http-프로토콜-특징)
- [3. 실습](#3-실습)
  - [3.1. 브라우저가 요청한 부분](#31-브라우저가-요청한-부분)
    - [3.1.1. 요청라인](#311-요청라인)
    - [3.1.2 요청헤더](#312-요청헤더)
  - [3.2. 서버가 응답한 부분](#32-서버가-응답한-부분)
    - [3.2.1. 상태 라인](#321-상태-라인)
    - [3.2.2. 응답 헤더](#322-응답-헤더)
    - [3.2.3. 메세지 바디](#323-메세지-바디)
  - [3.3. 실습1](#33-실습1)
  - [3.4. 실습 2](#34-실습-2)
- [브프드릐드](#브프드릐드)
  - [3.5. 실습3 - static file server](#35-실습3---static-file-server)

# 1. 요약

- 블로킹
- 스레드
- IO
- 소켓

## 1.1. 블로킹

키 입력 대기, 데이터 수신 대기 등 IO와 관련해서 코드가 특정라인(해당 연산 메서드 호출 부분)에 멈춤

## 1.2. 스레드

- 한 프로그램 내에서 실행 흐름이 두 개 이상이 될 수 있음
- 블로킹이나 연산 코스트가 높은 작업을 별도로 분리할 수 있음
  - `serverSocket.accept()`

## 1.3. IO

InputStream  / OutputStream

- InputStream : 우리가 작성하는 프로그램의 도착지(키보드로부터, 외부 컴퓨터로부터 등)
- OutputStream : 우리가 작성하는 프로그램이 출발지(화면에 출력, 외부 컴퓨터로 전송 등)

## 1.4. 소켓(자바 소켓)

크게 두 가지로 나뉨
- ServerSocket(서버)
- Socket(클라이언트)

### 1.4.1. 서버 - ServerSocket

```java
int port = 12345;
// 해당 포트 번호로 서버시작!
final ServerSocket serverSocket = new ServerSocket(port);
// 클라이언트의 접속을 대기
// 접속되면 클라이언트와 서버간의 스트림을 가지고 있는 소켓 생성
final Socket client = serverSocket.accept();
```

### 1.4.2. 클라이언트 - Socket

```java
final String ip  = "아이피주소!"
final int port = 12345;
// 해당 ip와 해당 port로 접속
final Socket socket = new Socket(ip, port);

```

# 2. HTTP

[https://tools.ietf.org/html/rfc2616]

## 2.1. HTTP Message

HTTP 메시지는 :
- 클라이언트가 서버에게 하는 `요청(request)`
- 서버가 클라이언트에게 주는 `응답(response)`
으로 구성이 됨

메세지 구조
```text
    GET /HTTP / 1.1   //시작라인
    ---------------------------
    Cache-Control : 값  //헤더
    Cache-Control : 값  //헤더
    ---------------------------
            //비어있는 줄이 있으면 바디 시작
        [바디]
```

1. 시작라인(start-line)
   1. 요청 라인(클라이언트(대표적으로는 브라우저))
   2. 상태 라인(서버)
      1. (너의 요청에 대해서 성공이면 ok 서버에서 요청 처리 결과)
2. 메세지 헤더(message)
3. 메세지 바디 : 전송할 데이터

### 2.1.1. 시작라인(start-line)

HTTP 메세지의 시작을 알리는 라인

* 요청(c -> s)의 경우 `요청라인(request line)`
* 요청(s -> c)의 경우 `응답라인(response line)`

### 2.1.2. 메세지 헤더 (message header)

필드 이름, 필드 값으로 구분됨. 구분자는 `콜론(:)` 으로.
```text
Cache-Control : 값    // 스트링 구분 가능
```

### 2.1.3. 메세지 바디 (message body)

필수값은 아님. 데이터 전송이 필요 할 때 이 부분에서 담아서 보냄
요청과 응답 모두에서 바디사용 가능. 다만 헤더에 바디의 길이를 알려주어야 함.

## 2.2. 요청(Request)

1. 요청 라인  - 시작
2. 요청 헤더
3. 메세지 바디 

### 2.2.1. 요청라인(request line)
```text
// SP는 스페이스바
Method SP Request-URI SP HTTP-Version CRLF
```
* Metgod : HTTP Method [https://developer.mozilla.org/ko/docs/Web/HTTP/Methods]
  * 해당 리소스에 대해 어떤 동작을 수행할 것인가?
* SP : Separator. 여기서는 공백 사용
* Request-URI : URI(Uniform Resource Identifier)  - 리소스
  * `/html/rfc2616#section-4`
  * `/`
  * `users`
* HTTP-Version : HTTP 버전
  * `HTTP/1.1`
* CRLF : 개행. Carraige Return Line Feed

### 2.2.2. 요청 헤더(메세지 헤더)

HTTP Message 헤더랑 동일.  요청에 대한 메타 정보.

```text
메세지 헤더 = 요청 헤더 인가요 ?   //질문

응답이나 요청의 메타 정보가
메세지 헤더에 들어갑니다
```
### 2.2.3. 메세지 바디

전송할 데이터. 이 데이터 길이를 `Content-Length`헤더에 바이트 수 명시 필요.
(값이 정확 해야됨.)

- `Content-Length` : 메세지 바디의 데이터 길이 바이트 수를 명시 해야함
- `Content-Type` : 메세지 바디의 데이터 타입(i.e. `text/html`, `application/json`)


## 2.3. 응답  //요청이랑 비슷 

1. 상태 라인
2. 응답 헤더 
3. 메세지 바디 

### 2.3.1. 상태라인
상태 라인의 구조는 다음과 같음

```text
HTTP-Version SP Status-Code SP Reason-Phrase CRLF

//Reason-Phrase는 페이지 낫 파운드
//Status-Code 404 번호이름
404 Page Not Found
```
* Status-Code : 서버의 처리 결과 상태 값을 표현하는 수 
* Reason-Phrase : 상태 값을 표현하는 문자열

상태 라인 예제
```예제
HTTP/1.1 404 Page Not Found
```

## 2.4. HTTP 프로토콜 특징

- 상태가 없다 (Stateless Protocol)
- 요청-응답 후 접속 종료

# 3. 실습

## 3.1. 브라우저가 요청한 부분
한번 요청 한 다음에 끊어버림 요청응답간에 상태 유지가 정해지지 않음
로그인 체크를 할 때 어떻게 할까?

```text
GET / HTTP/1.1  // 요청라인
Host: localhost:8081
Connection: keep-alive
Cache-Control: max-age=0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9
Accept-Encoding: gzip, deflate, br
Accept-Language: ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7 
    //crlf는 ("") 쿼리지 리턴 라인 필드... null이 아니라 "" 빈문자열로 비교
```

### 3.1.1. 요청라인

GET / HTTP/1.1 

HTTP method는 `GET`
URI는  `/`
프로토콜은 `HTTP/1.1`

### 3.1.2 요청헤더

Host ,Connection 등등.......  :으로 표시된거

## 3.2. 서버가 응답한 부분

image.png; 라는 타입의 정보

```text
HTTP/1.1 200 OK 
Content-Type: text/html; charset=UTF-8
Content-Length: 160

<!DOCTYPE html>
<html>
    <head>
        <title>Hello HTTP Server!</title>
    </head>
    <body>
        <h1>제목이고</h1>
        <p>내용이야</p>
    </body>
</html>
```

라인 헤더 바디 

### 3.2.1. 상태 라인

HTTP/1.1 200 OK 

프로토콜은 `HTTP/1.1`
상태 코드 `200`
Reason Phrase는 `OK`

### 3.2.2. 응답 헤더

```text
Content-Type: text/html; charset=UTF-8
Content-Length: 160
```
Content-Type : 내가 body에 담아준 데이터는 text/html이야. 인코딩은 UTP-8임.
Content-Length : 내가 body에 담아준 데이터 길이는 160바이트야.

### 3.2.3. 메세지 바디
```text
<!DOCTYPE html>
<html>
    <head>
        <title>Hello HTTP Server!</title>
    </head>
    <body>
        <h1>제목이고</h1>
        <p>내용이야</p>
    </body>
</html>
```

우리가 보여주고 싶은 HTML 텍스트.
결국 바디를 받아서 랜더링 한거임.

## 3.3. 실습1

1. 이미지를 응답해준다.
   1. Content-Type : image/png; image/jpeg;
   2. Content-Length : 응답할 리소스의 길이(바이트)

HTTP/1.1 200 OK
Content-Type : 

## 3.4. 실습 2

1. 소켓 실습 - 서버 소켓 생성 후 접속 대기
   1. 브라우저로 접속 해보기. 접속 시 콘솔에 접속했다는 메세지 출력
2. 요청 받기 실습 - InputStream. 브라우저가 요청 시 전송한 HTTP 메세지 모두 출력
   1. 요청 라인
   2. 요청 헤더
3. 응답 하기 실습 - OutputStream. (Content-Length, Content-Type 유의)
   1. html 문자열 응답하기
   2. 파일(이미지, 텍스트) 읽어서 응답
      1. html, css (text/html; text/css;)
      2. 이미지 (image/png; image/jpeg)

# 브프드릐드

```java
public class BufferedReaderExample {

    public static void main(String[] args) {
        try (InputStream in = new FileInputStream("C:\\Users\\user1\\Desktop\\abc.txt")) {
            final InputStreamReader isr = new InputStreamReader(in);
            final BufferedReader br = new BufferedReader(isr);
            System.out.println("v: " + br.readLine());
            System.out.println("v: " + br.readLine());
            System.out.println("v: " + br.readLine());
            System.out.println("v: " + br.readLine());
            System.out.println("v: " + br.readLine());
            System.out.println("v: " + br.readLine());
            System.out.println("v: " + br.readLine());
            System.out.println("v: " + br.readLine());
            System.out.println("v: " + "".equals(br.readLine()));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
```

## 3.5. 실습3 - static file server

과제내용
1. 브라우저에서 `/file이름`으로 요청하면 `file이름`에 해당하는 파일을 응답
2. 루트 디렉터리는 알아서 지정됨.
3. 루트 디렉터리 내의 파일을 클라이언트에게 응답.

문제 분석
1. Paths.resolve로 지정된 디렉토리와 사용자가 원하는 파일의 이름을 합쳐서 절대 경로 얻는 메서드
2. 응답해줄 파일에서 mime type(i.e text/html, image/png)을 반환해주는 메서드
   1. URLConnection.guessContentTypeFromName(경로)
3. 응답해줄 파일에서 사이즈 반환해주는 메서드
4. 요청라인에서 URI 분리해주는 메서드 //컨텐트 렝뜨의 헤더를 채워주기 위해서0

응답에 필요한 것 
- Content-Type : mime type을 알려주어야 함.
- Content-Length : 응답한 파일의 길이(바이트 수)
- 메세지 바디에 넣을 byte배열

위의 것들을 위해 필요한 것
1. 요청 라인에서 URI 추출
2. 파일 절대 경로 추출
3. 파일로부터 mimetype 추출
4. 파일 길이 추출
5. 파일 byte 배열로 반환

