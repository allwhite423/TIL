## Ch 4. Data Structures : Objects and Arrays
> story : 주인공(Jacques)이 squirrel 혹은 wolf로 변할 수 있는데, 변하는데 있어서 어떤 인과관계가 있는지 특정 패턴을 찾으려고 함.
### Data Sets
- array : [] 사용, index는 0부터 시작
```javascript
let listOfNumbers = [2, 3, 5, 7, 11];
console.log(listOfNumbers[2]);
// 5
console.log(listOfNumbers[0]);
// 2
```

### Properties
- myString.***length*** : myString이라는 value의 length property에 접근
- null, undefined : property 無
- 그 이외의 JavaScript의 거의 모든 value는 property 有
```javascript
null.length;
// TypeError : null has no properties
```
> nonvalue의 property는 없으므로 접근시 에러남

- 접근방법 2가지 : **value.x / value[x]**
- property 이름
	- property가 color임 -> **value.color**
	- value 이름이 binding i에 들어있음 => **value[i]**
	- property이름이 string인 경우 : []만 사용 가능 => **value["John Doe"]**

### Methods
- function을 가지는 property를 method라고 함
```javascript
let doh = "Doh";
console.log(typeof doh.toUpperCase);
// function
console.log(doh.toUpperCase());
// DOH
```
> 모든 string은 toUpperCase property를 갖고 있음 => toUpperCase는 string의 method이다.

- array 의 method : ***push(),  pop()*** (like stack)
```javascript
let seq = [1, 2, 3];
seq.push(4);
seq.push(5);
console.log(seq);
// [1,2,3,4,5]
console.log(seq.pop());
// 5
console.log(seq)
// [1,2,3,4]
```
### Objects
- object : arbitrary collections of properties (임의의 속성 모임)
```javascript
let day1 = {
	squirrel : false,
	events: ["work", "touched tree", "pizza", "running"]
};

console.log(day1.squirrel);
// false

console.log(day1.wolf);
// undefined

day1.wolf = false; 
// 새로운 wolf property 생성하여 값 할당

console.log(day1.wolf);
// false
```
- ***delete*** : 단항 연산자. property를 object로부터 삭제
	- 형식) delete objectname.propertyname
- ***in*** : object에 string 이름의 property가 있으면 true, 아니면 false return
	-  형식) string in object 
```javascript
let anObject = {left: 1, right: 2};
console.log(anObject.left);
// 1
delete anObject.left;
console.log(anObject.left);
// undefined

console.log("left" in anObject);
// false
console.log("right" in anObject);
// right
```
- ***Object.keys(obj)*** : parameter로 object를 넘기면, 해당 object의 property 이름들을 string array로 return
	```javascript
	console.log(Objects.keys({x: 0, y: 0, z: 2}));
	// ["x", "y", "z"]
	```
- ***Object.assign(obj1, obj2)*** : obj2에 있는 property를 모두 복사하여 obj1에 넣기
	- obj1에 obj2를 assign
	- 중복되는 property 의 value는 overwrite됨
	```javascript
	let objA = {a: 1, b: 2};
	Object.assign(objA, {b: 3, c: 4});
	console.log(objA);
	// {a: 1, b: 3, c: 4}
	```
### Mutability
- numbers, strings, booleans : ***immutable*** = impossible to change values of those types
- object : ***mutable*** = possible to change properties
- let 과 const로 object 선언
	- == 객체가 변하지 않는다는 의미
	- == object 안의 contents는 변할 수도 있다.
	- != object의 property는 변하지 않는다
	```javascript
	let obj1 = {value: 10};
	let obj2 = obj2;
	let obj3 = {value: 10};

	console.log(obj1 == obj2);
	// true (같은 객체를 가리킴)
	console.log(obj1 == obj3);
	// false (value는 같아도 다른 객체를 가리키므로 다른 identity임

	obj1.value = 15;
	console.log(obj2.value);
	// 15
	console.log(obj3.value);
	// 10
	```

	```javascript
	const score = {visitors: 0, home: 0};
	score.visitors  = 1;
	// 가능
	score = {visitors: 1, home: 1};
	//불가능
	```

- == operator의 한계
	- 같은 identity의 object인지는 확인 가능
	- object안의 contents 가 같은지는 모름

### The Lycanthrope's Log
> 늑대인간 log
- Jacques's journal & set up the environment to keep it
	```javascript
	let journal = [];

	function addEntry(events, squirrel) {
		journal.push({events, squirrel);
		// object를 표현하는 shorthand 방식
	}
	```
	> events : 그날 한 일을 모은 string array
	> squirrel : 다람쥐로 변했으면 true, wolf면 false
- Jacques records the day (하루를 기록함)
```javascript
// 하루동안 한 일 => event
// squirrel로 변하면 true, wolf로 변하면 false
addEntry(["work", "touched tree", "pizza", "running",
          "television"], false);
addEntry(["work", "ice cream", "cauliflower", "lasagna",
          "touched tree", "brushed teeth"], false);
addEntry(["weekend", "cycling", "break", "peanuts",
          "beer"], true);
```
- Jacques 는 충분히 data가 모이면 이를 바탕으로 squirrel이 되는 상관관계 통계를 내려고 함
- **Correlation(상관계수)**
	- -1 ~ 1 사이의 값을 가짐
	- 절대값이 1에 가까울 수록 유관
	- 0에 가까울수록 무관
- ***phi coefficient (ϕ)*** : 2개의 boolean variables 간의 상관계수(correlation)을 측정하는 공식(formula)
$$ ϕ  = \frac{n_{11}n_{00} - n_{10}n_{01}}{{\sqrt {n_{1•} * n_{0•} * n_{•1} * n_{•0}} }}$$

	- 아래첨자에서 ***0=false, 1=true***
	- $$n_{AB}$$ : _A_(squirrelness 다람쥐여부),  _B_(pizza여부)
	- $$n_{1•}$$ : 첫번째 변수가 true일 때, 모든 측정값의 합
	- ex) 공식에서 분모 = 1*76 - 4*6 = 40 
	       분자 = sqrt(5*85*10*80=340000) = 583.09...
![enter image description here](http://eloquentjavascript.net/img/pizza-squirrel.svg)
		_**ϕ**_ = 40/583.09... = 0.0685....
		pizza와 변하는것 사이엔 관계가 거의 없다고 봐도 됨
### Computing Correlation
- 위에서 본 상관계수 값 계산을 구현해보기
- 측정값을  array로 받음  (size : 4)
	- 순서는 00, 01, 10, 11
- ***ϕ coefficient function phi***: array로 값을 받아 상관계수 return
	```javascript
	//table은 측정값이 들어있는 크기 4의 배열
	function phi(table) {
		return (table[3]*table[0] - table[2]*table[1])/
		Math.sqrt( (table[3]+table[2]) 
					* (table[0]+table[1])
					* (table[1]+table[3])
					* (table[0]+table[2]) );
	}
	
	console.log(phi([76, 9, 4, 1]));
	// 0.068599434
	```
	> Math.sqrt() 로 제곱근 값 구함

<br>

- **event를 입력받아 해당 event에 해당하는 측정값을 array로 반환하는 함수 구현하기**
	- _JOURNAL_ 변수에 저장되어 있는 기록에서 event 에 해당하는 애들만 count해서 =>  측정값 array로 변환하는 함수
	- _JOURNAL_ binding : events와 squirrel 속성으로 이루어진 object로 구성된 array
	```javascript
	var JOURNAL = [
  {"events":["carrot","exercise","weekend"],"squirrel":false},
  {"events":["bread","pudding","brushed teeth","weekend","touched tree"],"squirrel":false},
  {"events":["carrot","nachos","brushed teeth","cycling","weekend"],"squirrel":false},
	```
	- ***function tableFor(event, journal)***
		- journal 변수를 loop안에서 돌면서 event 에 관련한 측정값 만들어서 array로 반환
	```javascript
	function tableFor(event, journal) {
		let table = [0, 0, 0, 0];
		
		for(int i = 0; i < journal.length; i++) {
			let entry = journal[i];
			let index = 0; //두 변수 모두 false인 경우
			
			//event가 있는 경우 - index 1, 3
			if(entry.events.includes(event)) index += 1;
			//squirrel이 true인 경우 - 2, 3
			if(entry.squirrel) index +=2;
			
			table[index]++; //해당하는 경우의 count++
		}
		return table;
	}
	
	console.log(tableFor("pizza", JOURNAL));
	// [76, 9, 4, 1]
	```
	> includes() 함수: array에 parameter로 넘겨준 요소가 있는지 체크
### Array Loops
- 2가지 방법이 있음
	```javascript
	// way 1
	for(int i = 0; i < JOURNAL.length; i++){
		let entry = JOURNAL[i];
		console.log(`${entry.events.length} events`);
	}
	
	// way 2 - of 사용
	for(let entry of JOURNAL){
		console.log(`${entry.events.length} events`);
	}
	```
## The final analysis
- JOURNAL에 있는 모든 event 찾기
	```javascript
	function journalEvent(journal) {
		let allEvents = [];
		for(let entry of journal) {
			for(let event of entry.events) {
				if(!allEvents.includes(event)) { 
					allEvents.push(event); //없으면 넣기
				}
			}
		}
		return allEvents;
	}
	
	console.log(journalEvent(JOURNAL));
	// → ["carrot", "exercise", "weekend", "bread", …]
	```
	
- 모든 event에 대한 상관계수 구하기
	- 모든 event를 돌면서 ***phi*** function call하기
	```javascript
	for(let event of journalEvent(JOURNAL)) {
		console.log(event + ": " + phi(tableFor(event, JOURNAL));
	}
	// → carrot:   0.0140970969
	// → exercise: 0.0685994341
	// → weekend:  0.1371988681
	// → bread:   -0.0757554019
	// → pudding: -0.0648203724
	// and so on...
	```
- 좀 더 연관관계가 있는 event 만 출력하기
	- 절대값이 0.1보다 큰 것만 출력
	```javascript
	for(let event of journalEvent(JOURNAL)) {
		let correlation = phi(tableFor(event, JOURNAL));
		if(correlation > 0.1 || correlation < -0.1) {
			console.log(event + ": " + correlation);
		}
	}
	// → weekend:        0.1371988681
	// → brushed teeth: -0.3805211953
	// → candy:          0.1296407447
	// → work:          -0.1371988681
	// → spaghetti:      0.2425356250
	// → reading:        0.1106828054
	// → peanuts:        0.5902679812
	```
- 상관계수가 높은 event를 합쳐서 상관계수 구하기
	- 위의 결과에서 ***peanuts & brushed teeth***가 상관계수가 높음
	- peanuts는 +, brushed teeth 는 - 관계
	```javascript
	for(let entry of JOURNAL) {
		//peanut은 포함하고, brushed teeth 없는 케이스
		if(entry.events.includes("peanuts") &&
		!entry.events.includes("brushed teeth")) {
			entry.events.push("peanuts teeth");// 알아볼 수 있게 새로운 event 넣기
		}
	}
	console.log(phi(tableFor("peanuts teeth", JOURNAL));
	// 1
	```
	> peanut 먹고 이 안닦은 event 에서는 squirrel 백퍼

### Array 관련 method
- 넣기
	- push() : array 맨 뒤에 insert
	- unshift() : array 맨 앞에 insert
- 빼기
	- pop() : 맨 뒤의 item get & remove
	- shift() : 맨 앞의 item get & remove
	```javascript
	let todoList = [];
	function remember(task) {
		todoList.push(task); //맨 뒤에 넣기
	}
	
	function getTask() {
		return todoList.shift(); //맨 앞에서부터 빼기
	}
	
	function rememberUrgently(task) {
		todoList.unshift(task); //맨 앞에 넣기
	}
	```
- stack : push, pop
- queue : unshift, pop
- 찾기
	- ***indexOf(n)*** : 앞에서 부터 검색해서 n이 맨처음 발견되는 곳의 index 반환
	- ***lastIndexOf(n)*** : 뒤에서 부터 검색 "
	```javascript
	console.log([1, 2, 3, 2, 1].indexOf(2));
	// 1
	console.log([1, 2, 3, 2, 1].lastIndexOf(2));
	// 3
	```
- 자르기 (substring)
	- slice(s, e) : s 포함, e 불포함
	- slice(s) : s부터 끝까지
- 합치기
	- a.concat(b) : a + b
	```javascript
	//특정 index의 element 지운 array를 반환하는 함수
	function remove(array, index) {
		return array.slice(0, index).concat(array.slice(index+1));
	}
	
	console.log(remove([1, 5, 10, 15, 20], 1));
	// [1, 10, 15, 20]
	```

### String  관련 속성
- length
- toUpperCase()
- string 변수에 새로 property 추가 불가능 => immutable
	- type중에 숫자, string, boolean은 object가 아님
	- 새로 property 추가하려고 하면 error는 나지 않지만, 저장되지도 않는다
	- immutable = cannot be changed
- slice(s, e) : array랑 같음
- indexOf(n) 
	- n에 한자리 이상 string도 가능
	- 첫 index를 반환해줌
- trim()
	- hitespace (spaces, newlines, tabs, and similar characters) 삭제
- padStart(원하는길이, padding character)
- split(기준)
- 
