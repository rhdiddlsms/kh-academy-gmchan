# 1. JQuery 기본

# 1.1. JQuery 개요

- JQuery: 
  - 모든 브라우저에서 동작하는 클라이언트 자바스크립트 라이브러리
  - jQuery란 JavaScript의 생산성을 향상시켜주는 JavaScript 라이브러리이다.

# 1.1.1. 라이브러리란?

- 자주 사용하는 코드들을 재사용할 수 있는 형태로 가공해서 프로그래밍 효율을 높여주는 코드들이다.

# 1.1.2. jQuery의 특징

- Element를 선택하기 쉽게 할 수 있다.
- 선택된 Element들을 효율적으로 제어할 수 있다.
- JavaScript로 만들어진 라이브러리이다.


# 1.2. 목적

- 문서 객체 모델(Document Object Model)과 관련된 처리를 쉽게 구현

- 일관된 이벤트 연결을 쉽게 구현

- 시각적 효과를 쉽게 구현

- Ajax 어플리케이션을 쉽게 개발



# 1.3. 사용 방법

- 다운로드 후 스크립트 내에서 참조

다운로드 URL: https://jquery.com/download/

참조코드: <script src="경로\jquery-3.3.1.js"></script>

- 웹을 통해서 참조(CDN 방식)

참조 URL 받는 곳: https://code.jquery.com/



# 1.4. 기본 형태

- $('선택자').함수명();
- jquety는 $로 시작한다.
- jquery는 인자값으로 CSS selector를 줄 수 있다.

``` css
$(제어대상).method1().method2();
주어.서술어
```

jQuery는 jQuery의 특성한 문법 체계를 가지고 있기 때문에 JavaScript가 아닌 느낌이 들긴 하지만 사실은 JavaScript에서 허용하는 범위 안에서의 문법이다.

jQuery를 사용하게 될 경우, JavaScript를 사용했을 때보다 생산성이 드라마틱하게 높아진다.


# 1.5.  $(document).ready()

- 문서가 준비되면 실행될 함수

- 자바스크립트의 window.onload = function () {}; 과 같은 역할



# 1.6. each() 메소드

- 자바스크립트의 for in 반복문처럼 객체 혹은 배열의 요소를 검사하는 메소드

- 형태

$.each(object, function(index, 값){});

$(선택자).each(function(index, 값){});

- 예시

$('h1').each(function (index, item) {

$(item).addClass('cls'+index); }); // item을 this로 대체 가능

h1태그에 순서대로 index를 붙여서 클래스 적용



# 1.7. $.extend() 메소드

- 객체 결합 메소드

- 형태: $.extend(객체, 추가객체, 추가객체...)

- 객체간의 키가 겹칠 경우 이후에 추가된 키의 값으로 초기화됨

- 하나의 객체만 추가할 경우에는 깊은 복사(참조값X)

- 예시

var user={name:david};

$.extend(user, {region: 'New york', age: 20});

-> user 객체는 name, region, age 객체를 가지게 됨



# 1.8. $.noConflict()

- $ 식별자 제거

- 식별자 $가 겹칠 경우에 사용

- 식별자 $를 삭제하고 새로운 식별자 선언 가능

- 사용 예시

$.noConflict()

var J=jQuery;

J('div').css('color', 'red'); 

-> 식별자를 $가 아닌 J로 사용하게 됨