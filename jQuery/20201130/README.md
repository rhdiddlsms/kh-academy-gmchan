# 1. jQuery란?

- html + CSS + javascript를 통합한 하나의 라이브러리
- 굉장히 쉬운 접근방법을 제공한다 --> 전체 처리 속도 감소
- 모든 javascript 문법은 그대로 사용 가능
- 대소문자 구별
- "or"는 구별하지 않음
- 라이브러를 사용하는 방법
  - CDN
  - 라이브러리를 해당 프로젝트내에 복사해서 사용
- jquery는 모든것이 함수화되어 있기 때문에 함수에 대한 이해가 좋을수록 jquery의 이해도가 높아질 수 있다.

id - 'abc'인 요소를 선택
```jquery
javascript : var id = document.getElementById('abc');
javascript function :
    var getID = function(id){
        return document.getElementByid(id);
    }
```

# 2. CSS

- id : #ele {...} --> $(ele).css(key, value)
- class : .ele
  - #ele > ele
  - #ele ele
  - #ele[]

DOM : HTML을 트리구조로 표현한것.

# 2.1. JSON 표기방법

- KEY:VALUE => {KEY:VALUE, KEY:VALUE,...}
- 배열 => {v1,v2,v3 ,...}
- 혼합형
  - 배열안에 map\
    - [{},{},{},...]
  - map 안에 배열
    - {key:[{},{},{},...}

