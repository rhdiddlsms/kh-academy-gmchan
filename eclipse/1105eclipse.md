클래스 선언한다 =  타입을 선언한다.


// Memo라는 타입을 사용자가 정의

``` java
public class Memo{ // 메모는 객체를 찾아 갈 수 있는 주소지 역할.
    //객체는 heap 영역에 저장 (참조값)
    private final String name;
    private final Date date;
}

private static Memo getMemo(){
    return new Memo("abc", new Date());
}
// 1. 메모a = new Memo("abc", new Date())
// 2. heap 메모 a 생성됨.
// 3. 잠조하는 값들이 getMemo에 들어감

```
값으로 생각 해주기

# JVM

## 스택(Stack Frame)

  - 책을 쌓는다고 생각하기 처음 쌓은거는 제일 나중에 나가게됨.
  - 변수랑 호출 순서가 스택에 기록이 된다.
  - 원시타입들(int,long.double등등) 이 스택에 들어간다.
  - 메소드 호출 스택들이 들어간다.
  - 지연변수 메인의 {} 안에있는 변수들인데 그 중에서 원시타입, 참조값들이 들어감.
  - 메소드가 실행 되고 난 후에는 변수들이 제거가 된다.

------
print();
----------------
a = 10;
main
----------------바닥

## 힙 (heap)
  - 생성한 객체들이 존재하는 공간.

## 객체

- 참조카운트(레퍼런스 카운트)
  - JVM(자바 가상 머신)   - 이 사용하지 않는 객체들을 삭제 시킴.
    - 객체는 힙에 들어간다
    - 겹겹히 쌓인다
    - 지역변수 값 참조값들이 들어간다

# 결론
## 스택 프레임
 - 메서드 호출 시 스택 프레임이 생성됨
 - 스택 프레임 내부 : 
   - 지역변수 (메소드 중괄호 안에서 유효한 변수들)
     - 원시타입(int,long,float,double ...등)  //원시타입은 힙공간에서는 안나옴.
     - 참조값

## 힙

- 생성된 객체가 존재하는 공간.

## 객체

- 참조 횟수(참조(레퍼런스) 카운트)
    - 참조(레퍼런스) 카운트가 0이 되면 JVM이 제거해줌
      - 이걸 GC(garbage collection)이라고 부른다.

## JVM 메모리 구조

검색(참고) : jvm memory layout

- young generation
    - 최근에 생성된 객체가 머무는곳
    - minor gc = young generation영역을 청소하는것
    - 청소 빈도가 높음
- old generation
    - young generation에서 살아남은 친구들이 이곳으로 이동함 
    - major gc - old generation영역을 청소하는것
    - 청소 빈도가 낮음


# 클래스 기술적인 부분.

## 클래스 선언
```java
[Access Modifier] [modifier] class {

}
```

-  접근지정자(Access Modifier)
    - private : 스코프(scope)가 클래스 내부 
    - public : 스코프(scope)가 프로젝트 전체
    - default(따로 지정 안해주면 디포트) : 스코프(scope)가 같은 패키지 전체(하위 클래스 x)
    - protected : 외부 접근 불가능

-  한정자(modifier)
   -  static : 클래스에 소속
      -  만약 메소드나 생성자에 static이 있을 때 
   -  final : 확장/변경 불가능 선언
      -  상속 불가능
   -  abstract : 추상 클래스/ 메소드

- 클래스 : 
   - 필드(멤버 변수)
   - 메소드  
   - 타입이라고 생각하기 (값 왔다리 갔다리ㅣㅣㅣㅣ)

## 클래스 상속
```java
    class 자식클래스이름 extends 부모클래스 {

    }
```
- 상속은 코드 재사용 느낌으로다가 사용하면 안된다.
  - 코드 재사용 하려면 new 객체명() 합성해서(다른 객체의 멤버로) 사용하기 
- 상속은 타입 계층 구조화 할 때 사용 


## 인터페이스, 추상클래스의 목적

- 공통된 약속

list.size();
- ArrayList     arr.length
- LinkedList

## 추상 클래스
```java
abstract 클래스이름 {
    // abstract 메소드선언();
    // 혹은 구체적인 구현
}
```
abstract를 사용하면 인터페이스로 사용 가능하고 


## 인터페이스
```java
interface 인터페이스이름  {
    //메서드 형태 (반환값, 이름, 파라미터만 지정)
}
```
인터페이스로 약속을 해서 레포지토리


1. 메세지 부터 결정하기
2. 메세지를 수신할(처리할) 객체
3. 객체에서 메세지 구현


메세지를 쓴다

```java
//메인에서


```


## enum을 쓰는 이유
- 1. 값의 범위를 특정
- 2. 타입 강제 가능


```java
enum 열거형이름{
    값1,값2,값3,값4
}

열거형이름 변수이름 = 값들 적기;


```