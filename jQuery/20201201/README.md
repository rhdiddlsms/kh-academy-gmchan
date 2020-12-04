# 1. jQuery - 1장 jQuery의 기초

- jQuery는 HTML문서, 보다 정확하게는 문서객체모델(DOM)과 자바스크립트 사이의 상호작용을 간단하게 해주는 오픈소스자바스크립트 라이브러리이다.
- jQuery의 철학 : Write less, do more (적게 작성하고, 보다 많이 한다)
- jQuery 선택자 : #은 id, .은 class
- jQuery('div').hide() => 모든 div를 숨긴다.
- jQuery('div').text('new content') => 모든 div의 내부텍스트를 변경한다.
- jQuery('div').addClass("updatedContent") => 모든 div에 updatedContent클래스를 추가한다.
- jQuery('div').show() => 모든 div를 나타낸다.
- jQuery 온라인문서 : http://docs.jquery.com/Main_Page
  
## 1.1. 문서에 jQuery 포함하기 (부가적인 기능향상을 위해 방법1을 사용하자!)

### 1.1.1. 방법1 
 문서에 jQuery 포함하기

 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>

### 1.1.2 방법2 

다운로드 받아 포함시키기

## 1.2. DOM 로드된 후 함수 실행 (로딩속도 향상을 위해 방법3을 사용하자!)

- 방법1 : jQuery(document).ready(function() { //실행구문 })

- 방법2 : jQuery(function() { //실행구문 })

- 방법3 : </body> 앞에 스크립트 추가

## 1.3. DOM요소 선택
```css
- jQuery('a') 
    => 모든 a요소 (== document.getElementsByTagName('a'))

- jQuery('a').length 
    => 모든 a요소의 개수

- jQuery('input', $('form')) 
    => 모든 form요소내의 input요소(들)

- jQuery('input', document.forms[0]) 
    => 첫번째 form요소내의 input요소(들)

- jQuery('input', 'body') 
    => body요소내의 input요소(들)
```
## 1.4. DOM요소 필터링
```css
- jQuery('a').filter('.external') 
    => 모든 a요소 중 클래스명이 external인 a요소(들) (== jQuery('a').filter(function(index) { return $(this).hasClass('external'); }))

- jQuery('p').filter('.middle').end() 
    => 모든 p요소 중 클래스명이 middle인 요소(들)의 필터링 전 요소(들) (== jQuery('p'))
```

### 1.4.1 파괴작업 (end()도 파괴작업의 이) : 일치된 jQuery요소집합에 변경을 가하는 모든 종류의 작업

## 1.5. DOM요소 검색
```css
- jQuery('p').find('em') 
    => 모든 p요소 하위의 em요소(들) (== jQuery('em', $('p')) ==jQuery('p em'))

- jQuery('p').filter('.middle').find('span').end().end() 
    => 모든 p요소 중 클래스명이 middle인 요소(들)의 하위 span요소(들)의 검색 전, 필터링 전 요소(들)

- (==jQuery('p'))
```

### 1.5.1 filter는 현재 요소(들)에 대해, find는 하위 요소(들)에 대해 작동

## 1.6. DOM 셀렉션 추가
```css
- jQuery('div').find('p').andSelf().css('border', '1px solid #993300'); 
    => div요소(들)과 하위 p요소(들) 모두에 대해 스타일 적용
```

## 1.7. DOM 탐색
```css
- jQuery('li:eq(1)') 
    => 두번째 li 요소

- 관련메소드 
    => next():다음요소, prev():이전요소, parent():상위요소
    children():하위요소들, nextAll():다음요소들, prevAll():이전요소들

- jQuery('li:eq(1)').parent().children(':last') 
    => 두번째 li요소의 상위요소의 마지막 하위요소

- 기타 탐색관련 메소드 : http://docs.jquery.com/Traversing
```

## 1.8. DOM요소 생성
```css
- jQuery('<p><a>jQuery</a></p>'); 
    => p요소 생성

- jQuery('<p><a>jQuery</a></p>').find('a').attr('href', 'http://www.jquery.com'); 
    => p요소를 생성하고 하위 a요소(들)을 찾아 속성 변경

- jQuery('<p><a>jQuery</a></p>').find('a').attr('href', 'http://www.jquery.com').end().appendTo('body');
    => p요소를 생성하고 하위 a요소(들)을 찾아 속성 변경 후 생성된 p 요소를 body요소 하위로 포함시킴
```

## 1.9. DOM요소 제거
```css
jQuery('a).remove(); 
    => 모든 a요소 제거

jQuery('a').remove('.remove'); 
    => 클래스명이 remove인 모든 a요소 제거
```
## 1.10. DOM요소 교체
```css
jQuery('li.remove').replaceWith('<li>removed</li>'); 
    => 클래스명이 remove인 모든 li요소들을 뒤에 나온 li요소로 변경
```
## 1.11.DOM요소 복제
```css
jQuery('ul').clone().appendTo('body'); 
    => 모든 ul요소들을 복제하여 body의 하위요소로 포함시킴

jQuery('ul#a li').click(function() { //실행구문 }).parent().clone(true).find('li').appendTo('#b').end().end().remove();

=> 아이디가 a인 ul 하위의 li요소들을 클릭하면 함수를 실행시키고 부모요소인 ul요소를 찾아 복제(true이면 이벤트까지도 복제됨)한 후 복제된 ul의

하위 li요소들을 찾아 아이디가 b인 요소의 하위요소로 포함시킨 후 기존 ul을 제거
```

## 1.11. 속성 제어

jQuery('a').attr('href', 'http://www.jquery.com').attr('href'); => 모든 a요소의 href속성의 값을 설정하고 가져옴

jQuery('a').attr({'href':'http://www.jquery.com', 'title':'jquery.com'}) => 모든 a요소의 href속성값과 title속성값을 설정

jQuery('a').removeAttr('title') => 모든 a요소의 title속성 제거

class 조작

addClass() : 클래스 추가 hasClass() : 클래스 값 확인 removeClass() : 클래스 제거 toggleClass() : 클래스 없으면 추가, 있으면 제거

HTML 컨텐츠 / 텍스트 조작

jQuery('p').html('<strong>Hello World</strong>'); => 모든 p요소에 html컨텐츠 삽입

jQuery('p').html(); => 모든 p요소의 html 가져옴

jQuery('p').text('Hello World'); => 모든 p요소에 text 삽입 (text메소드는 html을 escape한다)

jQuery('p').text(); => 모든 p요소의 text 가져옴

전역적인 충돌 없이 $ 사용

(function($) {

})(jQuery);


# 2. [JQuery Cookbook - 2장 jQuery로 요소 선택하기]

jQuery함수내에서 CSS셀렉터 사용
jQuery('#content p a'); => id가 content인 요소의 하위 모든 p요소의 하위 모든 a요소들
jQuery('#content p a').addClass('selected'); => 선택된 요소들에 selected 클래스 적용
직속 자손 결합자 (>) : 계층적 관계
jQuery('#nav li > a'); => id가 nav인 요소의 하위 모든 li요소의 직속 자손인 a요소들

jQuery('> p', '#content'); => id가 content인 요소의 직속 자손인 p요소들 => jQuery('#content > p')와 같다

jQuery('#content').children(); => id가 content인 요소의 모든 직속 자손들 => jQuery('#content').find('> *');과 같다

jQuery('#content').children('p'); => id가 content인 요소의 모든 직속 p요소들

인접 형제 결합자 (+) : 같은 레벨벨
jQuery('h1 + h2'); => h1요소에 인접한 h2요소들 => jQuery('h1').next('h2');와 같다
jQuery('h1').siblings('h2, h3, p'); => h1요소에 인접한 h2나 h3나 p 요소들
jQuery('li.selected').nextAll('li'); => selected클래스를 가진 모든 li요소들 다음에 나오는 모든 li요소들
일반 형제 결합자 (~)

jQuery('li.selected ~ li'); => selected클래스를 가진 모든 li요소들 다음에 나오는 모든 li요소들

필터

:first 첫번째 선택요소
:last 마지막 선택요소
:even 짝수번째 요소들
:odd 홀수번째 요소들
:eq(n) 인덱스가 n인 요소
:lt(n) 인덱스가 n보다 작은 요소들
:gt(n) 인덱스가 n보다 큰 요소들

jQuery(':even'); => 문서내의 모든 짝수번째 요소들
jQuery('ul li').filter(':first'); => ul요소다음에 나오는 첫번째 li요소들

현재 에니메이션 중인 요소 선택
jQuery('div:animated'); => 에니메이션 중인 div요소들

jQuery('div:not(div:animated)').animate({height:100}); => 에니메이션 중이 아닌 div요소들의 높이를 100까지 에니메이션

텍스트나 요소를 포함하는 요소 선택

jQuery('span:contains("bob")'); => bob라는 문자열을 포함하는 span요소들

jQuery('div:has(p a)'); => p요소 하위에 a요소를 가진 div요소들

jQuery('p').filter(function() { return /(^|\s)(apple|orange|lemon)(\s|$)/.test(jQuery(this).text()); });

=> apple이나 orange나 lemon이라는 텍스트를 가진 p요소들

일치되지 않는 요소 선택

jQuery('div:not(#content)'); => id가 content가 아닌 모든 div요소들

jQuery('a:not(div.important a, a.nav)'); => important클래스를 가진 div요소의 하위 a요소가 아니고 nav클래스를 가진 a요소가 아닌 a요소들

jQuery('a').click( function() { jQuery('a').not(this).addClass('not-clicked'); } ); => a요소를 클릭하면 모든 다른 a요소들에 not-clicked클래스 추가

$('#nav a').not('a.active'); => id가 nav인 요소의 하위 a요소들 중 active클래스를 가지지 않은 a요소들

가시성 기반 요소 선택

jQuery('div:hidden'); => 눈에 보이지 않는 div요소들

속성 기반 요소 선택

jQuery('a[href="http://google.com"]');=>href속성의 값이 http://google.com인 a요소들

jQuery('*[title][href]'); => title과 href 속성을 모두 가지는 요소들

jQuery('div[id^="content-sec-"]'); => id속성의 값이 content-sec-으로 시작하는 div요소들

속성 셀렉터

[attr] 특정 속성을 가지고 있는 요소
[attr=val] 속성이 특정값을 가지는 요소
[attr!=val] 속성이 특정값을 가지지 않는 요소
[attr^=val] 속성이 특정값으로 시작하는 요소
[attr$=val] 속성이 특정값으로 끝나는 요소
[attr~=val] 공백과 함께 특정값을 포함하는 요소 (car는 car와 일치하지만 cart와는 불일치)
폼요소 셀렉터

:text <input type="text" />
:password <input type="password" />
:radio <input type="radio" />
:checkbox <input type="checkbox" />
:submit <input type="submit" />
:image <input type="image" />
:reset <input type="reset" />
:button <input type="button" />
:file <input type="file" />
:hidden <input type="hidden" />
jQuery(':text'); => type속성의 값이 text인 모든 input요소들

jQuery(':input:not(:hidden)'); => 눈에 보여지는 모든 input요소들

jQuery(':text, :textarea'); => type속성의 값이 text이거나 textarea인 모든 input요소들

특성을 갖는 요소 선택

jQuery('*').filter(function() { return !!jQuery(this).css('backgroundImage') });

=> 배경이미지를 갖는 모든 요소들

=> !!는 타입을 불린으로 변경하기 위함

=> jQuery함수의 인자인 this는 모든요소들(*) 중 filter에 인자로 전달되는 시점에 함수에 인자로 전달된 요소를 가리키는데

요소를 jQuery함수의 인자로 넘겨 jQuery메소드를 사용할 수 있도록 함

jQuery('div').filter(function() { var width = jQuery(this).width(); return width>100&&width<200; });

=> 넓이가 100보다 크고 200보다 작은 모든 div요소들

컨텍스트 매개변수

컨텍스트란 jQuery가 셀렉터 식에 의해 매치되는 요소를 찾을 장소
jQuery에 의해 사용되는 기본 컨텍스트는 DOM계층에서 최상위 항목인 document임. 즉, jQuery('p')는 jQuery('p', 'document')와 같다
jQuery('p', '#content'); => id가 content인 요소의 하위 p요소들 (이때 #content가 p의 컨텍스트) => jQuery('#content p');와 같다

jQuery('form').bind('submit', function() { var allInputs = jQuery('input', this); });