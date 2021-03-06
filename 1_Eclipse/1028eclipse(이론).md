식은 평가된 값이 값으로 나오는게 식\
스테이트먼트는 명령 
# 문과 식의 차이

- 문 : 명령
- 식 : 평가 결과가 값.
- 조건식 : 평가 결과가 boolean

# foreach, enhanced   //for문

for(타입 변수이름 : 배열(컬렉션)){
}

// 배열안에 있는것을 반복해줌\
		for (String message : list) {\
			System.out.println(message);\
		}

# 타입의 종류

참조타입은 객체가 heap영역에 있다
- 원시타입(primitive type)  [정수형, 실수형, 문자형, 논리형]
    - 스택에 바로저장 
- 참조타입(reference type) [배열형 , 열거형, 클래스, 인터페이스]
    - 객체는 실제로 heap 공간에 존재하고, 그것을 가리키는 값이 스택
 
 메소드영역 힙영역 쓰레드영역 3개의 데이터 영역이 있는데 \
 참조타입은 힙 영역에 들어갔다고 생각 하기.\
GC(갈비지 컬렉션) 은 힙영역에 관련되어 있다.

자바 -> 이클립스 -> JVM 순서

쓰레드영역은 실행 흐름을 여러개를 만들 수 있음\
쓰레드는 자신만의 고유한 스택을 가지고 있다.

정수형일 때는 == 로 비교

String 비교 할 떄 equals로 사용하기


# 배열

1. 타입[] 변수이름;
2. 타입[] 변수이름;
3. 타입[] 변수이름 = new 타입[];

#배열 초기화 방법

1. 타입[] 변수이름 = {값,값,...,값};
2. 타입[] 변수이름 = new 타입[길이];

final int length = fruits.length;\
for문 쓸 때 조건식에서 length를 안전하게 안바뀌게 하려면 멤버필드에 써주기

# 파라미터(parameter)랑 인자(argument) 차이

y = f(x) \
x = 파라미터(parameter) \
y = f(5) \
5 = 인자(argument)

(String[] args)  메인메소드에 있는거 무었일까?
- 프로그램에 인자로 넘어온 파라미터(문자열)

#enum\
public enum Week {\
	월, 화, 수, 목, 금, 토, 일
}

해주고 메인으로 와서\
Week w = Week.금\
sysout

클래스는 객체를 만들기 위한 템플릿

객체 모델링 할때는 추상화를 쓴다

# 클래스 선언

접근지정자 class 클래스이름{\
    접근지정자  타입    변수명;

    

    접근지정자 메서드(){

    }
}

# 추상화
객체를 모델링 하는 기법인데
- 필요한 특징만 추출한다
    - 데이터 
    - 행동

#메인에서는\
클래스이름 객체 = new 클래스이름(생성자내용);\
객체.메서드();  //파라미터 있으면 ()에 인자값 넣어주기

# 객체와 객체 사이의 관계

# 캡슐화
- 데이터의 직접적인 조작을 막는다
  - 객체 정보가 오염됨
      - 객체가 참고하는 값이 오염되면 행동에 영향을 끼침.

# 접근지정자
- private  : 스코프가 객체 내부
- protected : 스코프가 패키지 내부
- public : 스코프가 패키지 전체

# 상속

부모의 특성을 물려 받는 행위\
부모객체 - 상위객체, superclass\
자식객체 - 하위객체, subclass


# 다형성



# 동등성 동일성
- 동등성(equality) : 두 객체의 내용이 같아?
- 동일성(identity) : 두 객체가 정확히 같은 객체야?\
    -  비교할 때는 equals 메소드를 사용

# 동등성 동일성 비교

- == 연산자 : 두 값이 동일한가?
- equals메서드 : 두 객체가 동일한가?

# 해쉬함수

임의의 길이로 된 데이터를 고정된 길이의 데이터로 매핑하는 함수
h(x) = y

- 해쉬값
- 해쉬코드
- 체크섬

객체를 식별하기 위해 사용합니다.
해쉬코드가 달라지면 키 값도 달라지고 인덱스도 달라집니다
다른 저장소에 저장됩니다.

출력되는 값이 같으면 인덱스도 같아지고 

같은거라고 생각했는데? 

# 상속

코드 재사용을 목적으로 사용하면 발생할 수 있는 문제

1. 불필요한 인터페이스 상속
2. 메서드 오버라이딩
        -> 원래 노출된 의도랑 동작이 변경됨
3. 부모 클래스와 코드를 공유하기 떄문에 변경에 의한 사이드이펙트가 자식에게 전파
4. 부모 클래스가 노출 -> 캡슐화

코드를 재사용 하기 위해
- 상속보다는 합성(CAR예제)를 사용
- 합성관계 -> 동적으로 객체를 결정할 수 있다. (실행시간)

그렇다면 상속이 필요한 것은?
타입이 계층적으로 표현될 때
ex) 메가커피의 상품
-커피
-스무띠
-케이크


# 클래스 선언

## 접근지정자 class 클래스이름{
      접근지정자 타입 변수이름;
      메소드();
}

## 접근지정자 => 언어 레벨에서 캡슐화(스코프 제한)
- private : 객체 내부에서만 접근가능
- protected : 패키지 내부에서만 접근 가능
- public : 모든 패키지 및 클래스에서 접근 가능

## 한정자(modifier)
- static : 클래스에 소석시킨다.
ABC.method();
- fanal : 확정/변경 불가능 
    1. 클래스 : 이 클래스를 상속하지 말것
    2. 상수
       1. abstract : 추상 클래스 / 메서드

생성자 메소드는 static으로 되서 new로 생성이 가능한거임

## 생성방법

```java
final Object obj = new Object();//파이널은 변경 가능성을 낮추려고 
```

## 메소드
- 이름 
- 시그니처
    - 이름
    - 파라미터 목록
- 바디

## 가변인자

method(타입 ...파라미터);

## 20201102 메가커피 순차적으로 작성 하는것
1. controllers 
//UI 사용자들에게 보여주는 부분

2. entities // 기능별로
// 비즈니스 로직  상품관리 쿠폰관리 


3. repioository 
// 저장하는 부분 컬렉션 , 데이터베이스 등 세부사항
// 실직적으로 entities가 구현하라고 지시

4. service  // data Access layer 
// 여러 엔티티들이 모여서 노는곳  엔티티들이 통합하는곳.
패키지 나누는 방식


리스트는 인터페이스
어레이 리스트는 구현체


1.메인부터 실행하라는 메소드
어느 객체가 받을까? new kiosk => 키오스크 클래스를 생성
kiosk.run(); 키오스크의 런 메소드로 가보자.

-> 0.안내메세지를 결정해달라
2.렌더 웰컴 메세지 

-> 1. 포장? 매장? 선택하기
choosePackingType() 메소드로 ㄱㄱ
타입을 생성해줘야됨. (패킹타입) 1. 포장, 2. 매장의 타입.  
삼항 연산자로 1 ? 포장 :  매장;

-> 2. 메뉴 선택 1.커피, 2. 스무디, 3. 케이크

-> 3. 오더서비스 영수증에 찍혀있는 주문서. 오더프로덕트dto와, 패킹타입 2가지가 적혀있음.
PackingType, orderproductDto 가지고 있다.



책임 : 어떤 객체가 이 메세지를 수신해서 처리 할건지
협력 : 메세지를 수신해서 누구한테 부탁 할껀지
역할 : 