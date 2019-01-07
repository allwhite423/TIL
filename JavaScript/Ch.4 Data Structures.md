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
	- 형식) ***delete _objectname._propertyname***
- ***in*** : object에 string 이름의 property가 있으면 true, 아니면 false return
	-  형식) ***_string in _object***
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
- ***Object.keys(obj)*** : parameter로 object를 넘기면, 해당 object의 property 이름들을 ***string array***로 return
	```javascript
	console.log(Objects.keys({x: 0, y: 0, z: 2}));
	// ["x", "y", "z"]
	```
- ***Object.assign(obj1, obj2)*** : obj2에 있는 property를 모두 복사하여 obj1에 넣기 (obj1 <-obj2)
	- obj1에 obj2를 assign
	- **중복되는 property 의 value는 overwrite 됨**
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

- **==** operator의 한계
	- 같은 identity의 object인지는 확인 가능
	- object안의 contents 가 같은지는 모름

### The Lycanthrope's Log
> 늑대인간 log
- Jacques's journal & set up the environment to keep it
	```javascript
	let journal = [];

	function addEntry(events, squirrel) {
		journal.push({events, squirrel});
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
- _ϕ coefficient function_ ***phi***: array로 값을 받아 상관계수 return
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
	// event 는 특정 이벤트 이름이 있는 string (ex. "pizza)
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
	- 위의 결과에서 ***peanuts & brushed teeth*** 가 상관계수가 높음
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
	- ***push()*** : array 맨 뒤에 insert
	- ***unshift()*** : array 맨 앞에 insert
- 빼기
	- ***pop()*** : 맨 뒤의 item get & remove
	- ***shift()*** : 맨 앞의 item get & remove
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
	> push, pop (뒤부터) / shift, unshift (앞부터)
	
- stack : push, pop /  queue : unshift, pop
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
	- ***slice(s, e)*** : s 포함, e 불포함
	- ***slice(s)*** : s부터 끝까지
- 합치기
	- ***a.concat(b)*** : a + b
	```javascript
	//특정 index의 element 지운 array를 반환하는 함수
	function remove(array, index) {
		return array.slice(0, index).concat(array.slice(index+1));
	}
	
	console.log(remove([1, 5, 10, 15, 20], 1));
	// [1, 10, 15, 20]
	```

### String  관련 속성
- ***length***
- ***toUpperCase()***
- string 변수에 새로 property 추가 불가능 => immutable
	- type중에 숫자, string, boolean은 object가 아님
	- 새로 property 추가하려고 하면 error는 나지 않지만, 저장되지도 않는다
	- immutable = cannot be changed
	```javascript
	let Diana = "Diana"; //Diana 이름의 String 변수
	Diana.age = 26;      //property age 추가 시도, but 저장 안됨
	console.log(Diana.age);
	// undefined
	```
- ***slice(s, e)*** : array랑 같음
- ***indexOf(n)***
	- n에 한자리 이상 string도 가능
	- 첫 index를 반환해줌
	```javascript
	console.log("dream".slice(2, 4));
	// ea
	console.log("dream".indexOf("r"));
	// 1
	console.log("candle light".indexOf("le"));
	// 4
	```
- ***trim()***
	- whitespace (spaces, newlines, tabs, and similar characters) 삭제
	```javascript
	console.log("     nct    dream    \n".trim());
	// nctdream
	```
- ***padStart(원하는길이, padding character)***
	```javascript
	console.log(String(6).padStart(3, "0");
	// 006
	
	```
- String 기준으로 자르기, 합치기
	- ***split(기준)*** : 기준으로 string나눠서 array로 return
	- ***join(기준)*** : string요소로 구성된 array를 기준으로 합침
	```javascript
	let favoriteLine = "Let's talk about love";
	let words = favoriteLine.split(" "); //공백으로 나누기
	console.log(words);
	// ["Let's", "talk", "about", "love"]
	console.log(words.join("//"));
	// Let's//talk//about//love
	``` 
- 반복
	- ***repeat(n)*** : n번 반복한 string return
	```javascript
	console.log("candleLight".repeat(3));
	// candleLightcandleLightcandleLight
	```
- array처럼 []로 접근 가능
	```javascript
	let d = "dream";
	console.log(d[3]);
	// a
	console.log(d[d.length-1]);
	// m
	```

### Rest Parameter
- parameter 개수를 한정하지 않음
	- parameter가 몇개이든 다 받을 수 있다
	- 형식) ...parameter이름 
	- rest parameter는 ***array*** 형식으로 들어감
	```javascript
	// argument 모두 받아서 그중 최댓값 return
	function max(...numbers) {
		let result = -Infinity;
		for(let number of numbers) {
			if(number > result)
				result = number;
		}
		return result;
	}
	
	console.log(max(4, 1, 9, -2));
	// 9
	```
	- **...** 점 세개는 argument로 array를 받는다는 의미가 되기도 함
	```javascript
	let numbers = [5, 1, 7, 9];
	console.log(max(...numbers));
	// 9
	```
	- ...은 array를 퍼뜨려주는 역할을 함.
	- 다른 argument와 함께 array를 포함해서 보내는 것도 가능
	```javascript
	let numbers = [5, 1, 7, 9];
	console.log(max(10, ...numbers, 2));
	// 10
	
	let words = ["Tuesday", "Wednesday"];
	console.log("Monday",  ...words, "Thursday"]);
	// ["Monday", "Tuesday", "Wednesday", "Thursday"]
	```

### The Math Object
- ***Math*** : 숫자 관련된 utility 함수를 가진 object
- namespace를 제공해서 숫자관련 함수나 value가 global 변수가 되지 않도록 함
	- global binding 지나치게 많으면 namespace를 오염시킴(pollute)
	- ex) ***Math***에서 ***max***를 제공하므로, 의도치않게 max함수를 overriding하는 사고를 방지할 수 있음
	- JavaScript는 ***let, const*** 로 선언한 변수는 taken이면 경고해주지만, ***var, function*** 으로 선언시는 경고 안함
		- scope 관련 참조
		- var, function은 overwrite?
- Math method
	- ***max()***
	- ***min()***
	- ***sqrt()***
	- ***random()*** : 0~1 사이 값을 return (0포함, 1불포함) (ex. 0.2587..)
	- ***floor()*** : n보다 작은 가장 가까운 정수를 return (***round-down***)
	- ***ceil()*** : n보다 큰 가장 가까운 정수를 return (***round-up***) 
	- ***cos() , sin(), tan()***
- ex) 특정 범위 안에서 random 숫자 생성하기
	```javascript
	// 0~9
	console.log(Math.floor(Math.random() * 10));
	
	// 1~10
	console.log(Math.ceil(Math.random() * 10));
	```
### Destructuring 구조분해할당
> [참조사이트](https://poiemaweb.com/es6-destructuring)
- 배열, 객체의 각 요소를 분해(destructure)하여 별개의 변수에 넣는 것
- 자세한 예시는 참조사이트 go!

### JSON
_serialize data_
- data 통신에 있어서 _serialize(직렬화)_ 하는게 효율적
- ***serialize*** : 외부시스템에서도 현재 시스템의 객체나 data를 사용할 수 있도록 byte 형태로 데이터 변환하는 것
- serialize하는 방식 중 하나가 JSON format
- [JSON이란 무엇일까?](https://nesoy.github.io/articles/2017-02/JSON)
- JSON = JavaScript Object Notation
- JSON data example
	```javascript
	{
	  "squirrel": false,
	  "events": ["work", "touched tree", "pizza", "running"]
	}
	```
	> javascript에서 object와 array 표현하는 방식과 같음

- ***key-value*** 쌍으로 구성됨
- JSON 관련 함수
	- ***JSON.stringify(_object)*** : object를 JSON format의 string으로 return
	- ***JSON.parse(_string)._key*** : string을 파싱하여 key에 대한 value를 return
	```javascript
	let obj = { squirrel: true, events: ["pizza", "shower"]};

	let string = JSON.stringify(obj);
	console.log(string);
	// {"squirrel":true,"events":["pizza","shower"]}

	console.log(JSON.parse(string).events);
	// ["pizza", "shower"]
	```
- object와 JSON 표기 차이점
	- key 이름에 **""** 유무

### Exercise
1. the sum of a range - 범위 내 숫자들의 합
- _function_ ***range***
	- input : start, end, step(optional)
	- output : start~end(포함) 숫자들의 array
	```javascript
	function range(...in) {
		let arr = [];
		let start = in[0];
		let end = in[1];
		let step = 1;
		if(in.length == 3)
			step = in[2];
		while(true) {
			arr.push(start);
			start += step
			if(step > 0) {
				if(start > end)
					break;
			} else {
				if(start < end) 
					break;
			}
		}
		return arr;
	}
	```
- _function_ ***sum***
	- input : array 1개
	- output: array 모든 요소의 합
	```javascript
	function sum(nums) { // 배열 하나만 받으므로 rest parameter 안 씀
		let ans = 0;
		for(let i = 0; i < nums.length; i++ ){
			ans += nums[i] * 1;
		}
		return ans;
	}
	```
```javascript
console.log(range(1, 10));
// → [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
console.log(range(5, 2, -1));
// → [5, 4, 3, 2]
console.log(sum(range(1, 10)));
// → 55
```
2. reversing an array - array 뒤집기
- index 맨 뒤부터 돌면서 새로운 array에 push 후 return
3. a list - 연결리스트
- list.keys = [value, rest]
	- rest : 연결된 다음 list object를 가리킴
- _function_ ***arrayToList***
	- input: value가 들어있는 array
	- output: input array를 value로 하는 연결 list 만들어서 맨 앞 객체를 반환
- _function_ ***sum***(reverse of arrayToList)
	- input: list object
	- output: list에 연결된 객체들의 value를 모은 array
- _function_ ***prepend(_element, _list)***
	- input: element(value) , list
	- output: 앞의 element를 value로 한 list 생성한 뒤, 두번째 parameter인 list의 앞에 연결
-  _function_ ***nth(_list, _index)***
	- input: list, n(list의 index로 0부터 시작)
	- output: list에서 n번째 list 의 value를 return, 없다면 undefined return
- recursive version of ***nth***
	- 다음 list(list.rest)와 n-1을 계속 호출하여, n이 0되면 value를 return

```javascript
function arrayToList(arr) {
	//뒤에서부터 만들어서 붙여나감
	let previousList = null;
	for(let i = arr.length-1; i >= 0; i++) {
		let currentList = {value: arr[i], rest: previousList};
		previousList = currentList;
	}
	
	return previousList;
}

function listToArray(list) {
	let arr = [];
	//  node != null 일 때 까지
	for(let node = list; node ; node = node.rest) {
		arr.push(node.value);
	} 
	return arr;
}

function prepend(element, list) {
	return {value: element, rest: list};
}

function nth(list, n) {
	if(list)
	let count = 0;
	let node = list;
	//way 1
	//for(let i = 0; i < n; i++, node=node.rest);
	// way 2
	while(count < n) {
		count++;
		node = node.rest;
	}
	return node.value;
}

function recursiveNth(list, n) {
	if(!list) { //list==null인 경우
		return undefined;
	} else if(n == 0) {
		return list.value;
	} else {
		return recursiveNth(list.rest, n-1);
	}
}

console.log(arrayToList([10, 20]));
// → {value: 10, rest: {value: 20, rest: null}}
console.log(listToArray(arrayToList([10, 20, 30])));
// → [10, 20, 30]
console.log(prepend(10, prepend(20, null)));
// → {value: 10, rest: {value: 20, rest: null}}
console.log(nth(arrayToList([10, 20, 30]), 1));
// → 20
```
5. **deep comparision** ***(!important)***
- **==** operator는 object 의 contents까지는 비교 못해줌
- 단순 identity만 같은지 비교함
- input: object 2개
- output: true/false
- 전략 
	- 두 parameter 가 모두 object인지 체크
		-  typeof 사용해서 object인지 확인
		- typeof null => object 이므로 유의할 것
	
	- 둘다 object일 때만 property 비교
	-  **===** operator로 비교
		- 피연산자들이 같고 피연산자들의 같은 형태인 경우 참을 반환
		- 같은 주소, 같은 값
	- **Object.keys(_object)*** 사용
		- key를 string으로 담은 array를 반환
```javascript
function deepEqual(a, b) {
	if(a === b) return true;
	
	if(typeof a == "object" && a != null 
		&& typeof b == "object" && b != null)
		return false;
	
	let keyA = Object.keys(a), keyB = Object.keys(b);
	
	if(keyA.length != keyB.length) return false;

	for(let key of keyA) {
		if(!keyB.includes(key) || !deepEqual(a[key], b[key]) return false;
	}
	
	return true;
}

let obj = {here: {is: "an"}, object: 2};
console.log(deepEqual(obj, obj));
// → true
console.log(deepEqual(obj, {here: 1, object: 2}));
// → false
console.log(deepEqual(obj, {here: {is: "an"}, object: 2}));
// → true
```
