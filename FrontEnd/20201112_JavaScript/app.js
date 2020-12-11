// ctrl + alt + n 누르면 실행


const obj = [ '감자', 10, [1,2,3,]]


for (value in obj){
    console.log(obj[value])
}

/*for문
for (var i =0; i<10;  i++){
    console.log(`${i+1}번째 출력.`)
}
*/

/*if문 분기
const a = 10

if(a>5){
    console.log('크다 ㅎ');
}
*/

/*
//자바 스크립트에서 객체는 컨테이너 내용물만 바뀌는 것
const obj = {
    abc: 'abc'
}
//멤버 접근 연산자(.)
console.log(obj.abc)

// 계산된 멤버 전근 연산자([]) computed member access operator
console.log(obj['abc'])

obj['alpha'] = 'a'
obj['beta'] = 'b'
console.log(obj)
*/


/*
const n = 10;
const message = 'test'

console.log(`상수 n의 값 : ${n}. 상수 message의 값 : ${message}`);
*/



// console.log('test');

// // 자바스크립트에서 기본적으로 변수 설정 하는법.
// var name;

// console.log(name);

//식별자
//변수
//함수
// 클래스
// 식별자 -실행 컨텍스트에 등록됨

/*
- 특수문자 제외한 숫자, 문자, 언더스코어(_), 달러 ($) 기호가능
- 하지만 숫자로 식별자 이름 시작은 불가능
- 예약어 (keyword, reserved word) 사용 불가능
*/

// ES6 변수, 상수 선언


// var name; //함수레벨 스코프
// let name1 = 'abc';
// const name2 = 'abc';   //const 는자바에서 final (변경불가능 - 상수)역할

/*
선언은 인터프리터한테 식별자를 등록하는것
초기회는 값을 할달하는것
선언 - 식별자를 등록
초기화 단계  - 값을 위한 공간을 할당하고 식별자랑 연결함. 초기화 하지 않았다면 undefined
*/

// console.log(name1);
// console.log(name2);


/* 동적 타이핑
1. 값을 보고 타임 추론
2. 언제든 식별자의 값이 변결 될 수 있음.
 */



