# 1. HTML

- HTML : HyperText Markup Language
- HTTP : HyperText Transfer Protocol
  - HTML 전송

URL(Uniform Resource Locator)
- http://127.0.0.1:5500/frontEnd/1109frontend.html
  - 127.0.0.1 - IP주소 (혹은 도메인)
  - 5500  - 포트
  - /frontEnd/1109frontend.html    - 리소스 경로

http포트 - 기본값 80
https포트 - 기본값 443  // 확인하려면 주소 옆에 자물쇠 있으면 https

# 2. 주소창에 입력했을 때 찾아가는 과정

1. 주소를 입력
2. 로컬에 등록된 DNS IP 주소로 해당 도메인을 질의(query)함
   1. 해당 DNS에 정보가 캐싱된 경우 바로 응답 받음
   2. 없는 경우 상위 DNS에게 질의
3. 응답 받은 IP 주소로 접속(브라우저가)
4. 해당 서버에서 리소스 요청
5. 해당 서버가 리소스 응답(html,js,image,audio,video)
6. 브라우저는 html 문서 받아서 렌더링

# 3. HTML

- 태그 - 문서 기본요소
  - <와> 로 감싸져있음. (<html>)
  - 권장 : 태그는 소문자로
  - 단일 태그 형태 : <태그/>
  - 일반 태그
    - <태그>내용</태그>
    - 여는 태그 : <태그>
    - 닫는 태그 : </태그>
  - 계충 구조로 되어 있다.(트리형태)
    - 포함관계 명확하게 할 것!
  - 태그는 속성을 가지고 있다.
    - <태그 속성 = 값 속성 = 값></태그>

# 4. html 태그

lang 속성
- ko : 한국어
- en : 영어
- ja : 일본어
- zh : 중국어

## 4.1 head 태그

더 알아보고 싶으면 SEO(Search Engine Optimization) 검색하기

- title 태그 - 제목표시
- meta
  - 문자셋
    - meta charset = "UTF-8"   
  - 브라우저 호환성 표시
  - 검색 결과 설명 지정
  - 검색 결과 표시 문구 지정
  - 봇 제어 

## 4.2 body

실제로 랜더링 될 정보들

# 1. 텍스트 - 블록

## 1.1. hn(n값 1~ 6)
  - heading, 제목표시

## 1.2. p태그
  - paragraph, 문단
    - 스페이스 아무리 많이 입력해도 공백은 하나로 표시됨.
    - 줄바꿈 없이 텍스트를 쭉 입력할 수 있음(부모영향 받아서 내려 갈 수 있음).
  - margin 값이 상, 하 밖에 없음

## 1.3. br태그

  - break, 줄바꿈
    - 단일태그임에 유의하기 </br> 로 엔터 치고 싶을 때 사용하기 

## 1.4. hr 태그 - 수평줄

  - horizontal rule , 수평줄

## 1.5. blockquote - 인용구

  - 인용구
  - margin(다른 객체와의 공백) 값이 상,하,좌,우 다 있음

## pre태그 

  - 입력 그대로 다 나옴 (공백, 탭 둘 다 입력 한 그대로 출력)

# 2. 텍스트 - 인라인(글자 출력하는 아무곳에 해도됨)

## 2.1. strong, b  - bold(글자 굵기) 처리

  - 텍스트 굵게 표시
  - <b>필요한 곳까지 진하게 표시된다.</b>

## 2.2. em, i - 이탤릭

  - <i></i> 는 기울기 
  - <em></em> 은

## 2.3. q - 인라인 인용구 (quote)

  - <q>쌍따움표를 추가해주는 역할</q> 

## 2.4. mark - 형광팬

  - <mark>형광팬 역할을 해준다.</mark>

## 2.5. span - 아무것도 안함.

  - 인라인에 스타일링 할 때 많이 사용 (버튼)


## 2.6. ruby - 동아시아 문자

글자위에 

HTML5の10の<ruby>新機能<rt>신기능</rt></ruby>あなたは知ってますか？


사이트 열어서 공부하기 (유튜브, 에어비엔비, 깃헙) 가서 f12번 누르기


# 3. 목록
  - 순서 없는 목록(unordered list)
  - 순서 있는 목록(orderd list)

## 3.1. 순서 없는 목록 (불릿 기호 나타내 줌)

  - ul, li
``` html
    <ul>
        <li>리스트</li>
        <ul>
            <li>으악</li>
        </ul>
    </ul>
```

## 3.2. 순서 있는 목록(숫자로 표현)

  - ol, li (들여쓰기가 된다.)

## 3.3. 설명 있는 목록

  - dl (description list)
  - dt - 제목
  - dd - 설명

# 4. 표

- table 
- tr(table row)
- td(tag define)
- th(tag header)

# 5. 이미지 (jpg, png, svg)

스케일이 깨지는건 이미지를 불러오는게 빠르다.
svg는 계산하는데 비용이 들지만 스케일 크기가 달라져도 이미지가 안깨진다.

img 태그 
```html
<img src = "이미지 url(또는 파일의 경로)"/>
```
src - 이미지 url, 파일 경로
alt - 대체 문구(alternative)
width - 너비
height - 높이

# 6. a 태그 (링크 넣기)

<a href = "링크"> 링크이름 </a>

속성
- href : 주소
- target : 링크가 표시될 방법
- download : 링크의 리소스를 다운로드

target 속성
- _blank  : 새창을 띄워줌
- self : 기본 값