# 1. 등장 배경

- 함수형 프로그래밍
    - 함수 : X -> Y
    - 프로그래밍에서의 함수
        - IO : 결과가 달라질 수 있음
        - 사이드 이펙트
- 함수형 프로그래밍
    - 동시성, 병렬성 처리에 효과적

# 2. 람다식 사용

람다를 사용하기 위한 기본 형식은 다음과 같다.  


```java
(type param1, type param2) -> {
    // 본문
}

// 파라미터가 하나면
P1 -> {}     //바로 사용 가능
// 함수 바디가 한줄이면
(P1) -> 코드;
```

# 람다식 

// 람다식 표현
(parameter) -> {
    // body
    // return type
}

//메서드 표현
type lambda(parameter){
    // body
    // return type
}

@FunctionalInterface
- 메소드는 단 하나

# 실습 
## 스트링 두개를 받아서 두개의 길이를 반환하기

- 파라미터 
  - string 파라미터 2개
- 반환 타입
  - int
(String s1, String s1)  -> {
    return s1.length() + s2.length();
}


1. 인터페이스 생성
2. @FunctionalInterface 어노테이션 추가
3. 위의 파라미터, 반환타입 정의에 마