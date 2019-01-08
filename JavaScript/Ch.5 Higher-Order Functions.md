## Ch 5. Higher-Order Functions

### Abstracting Repetition
- Plain function is a good way to build abstractions.
- do something a given number of times - for loop
	```javascript
	for(let i = 0; i < 10; i++ ){
		console.log(i);
	}
	```
- doing something N times
	```javascript
	function repeatLog(n) {
		for(let i = 0;i < n; i++) {
			console.log(i);
		}
	}
	```
- doing action function N times
	```javascript
	function repeat(n, action) {
		for(let i = 0;i < n; i++) {
			actions(i);
		}
	}
	
	repeat(3, console.log);
	// → 0
	// → 1
	// → 2
	```
	> function을 매개변수로 넘긴다.
	
- repeat function을 call할 때, 매개변수로 넘길 function을 생성한다 (미리 선언할 필요 없음)
	```javascript
	let labels = [];
	repeat(5, i => {
		labels.push(`Unit ${i + 1}`);
	});
	console.log(labels);
	// → ["Unit 1", "Unit 2", "Unit 3", "Unit 4", "Unit 5"]
	```

### Higher-Order Functions
- value 뿐만 아니라 action에 대한 추상화도 가능
	```javascript
	function greaterThan(n) {
		return m => m > n;
	}
	
	let greaterThan10 = greaterThan(10);
	console.log(greaterThan10(11));
	// true
	```
- function that changes other functions
	- 함수 f를 받아서, 그 함수 실행 앞뒤로 설명하는 내용을 추가한 함수를 return
	```javascript
	function noisy(f) {
		return (...args) => {
			console.log("calling with", args);
			let result = f(...args);
			console.log("called with", args, ", returned", result);
			return result;
		};
	}
	
	nodisy(Math.min)(3, 2, 1);
	// → calling with [3, 2, 1]
	// → called with [3, 2, 1] , returned 1
	```

- function that provides new types of control flow
	- test 가 false이면 그 뒤의 함수를 실행하는 함수
	```javascript
	function unless(test, then) {
		if(!test) then();
	}
	
	repeat(3, n => {
		unless(n % 2 == 0, () => {
			console.log(n, "is even);
		});
	});
	// → 0 is even
	// → 2 is even
	```
	- ***forEach(_func)*** : built-in array method
		- array의 각 요소에 대해 매개변수의 함수를 실행
	```javascript
	["A", "B"].forEach(l => console.log(l));
	// → A
	// → B
	```
### Script Data Set
- script-writing system 에 대한 object를 담은 변수 ***SCRIPTS***
- ***SCRIPTS*** example
	```javascript
	{
	  name: "Coptic",
	  ranges: [[994, 1008], [11392, 11508], [11513, 11520]],
	  direction: "ltr",
	  year: -200,
	  living: false,
	  link: "https://en.wikipedia.org/wiki/Coptic_alphabet"
	}
	```
	> javascript는  string element 1개당 16bit를 사용하여 표현하는데, Unicode에서 16bit로 모든 문자를 표현하는 건 불가능 => 어떤 문자는 2개(16bit*2)사용
	- direction : 해당 언어가 쓰이는 방향 (***ltr, rtl, ttb***)
	- ranges : array of Unicode character ranges. lower bound(inclusive) & upper bound(exclusive)
	- living : still in use or not

### Filtering Arrays
- ***filter function***
	- array의 요소 중 test가 true인 것을 모아 return
	```javascript
	function filter(array, test) {
		let passed = [];
		for(let element of arry) {
			if(test(element))
				passed.push(element);
		}
		return passed;
	}
	
	// filtering scripts that is still in use
	console.log(filter(SCRIPTS, script => script.living));
	```
	- 이미 존재하는 array의 요소를 지우는 방식 보다는, test를 통과한 요소만으로 구성된 새로운 array를 만듬
	- pure function : 주어진 array를 수정하지 않았기 때문
- 위의 함수는 built-in array function으로 이미 구현되어 있어 사용 가능
	```javascript
	console.log(SCRIPTS.filter(s => s.direction == "ttb"));
	```

### Transforming with Map
- array에 있는 element의 이름만으로 구성된 array를 갖고 싶다
	- map method :  입력받은 array와 사이즈는 같지만, transform된 내용만 담고 있음
	```javascript
	function map(array, transform) {
		let mapped = [];
		for(let element of array) {
			mapped.push(transform(element));
		}
		return mapped;
	}
	
	let rtlScripts = SCRIPTS.filter( s => s.direction == "rtl");
	console.log(map(rtlScripts, s => s.name));
	```
	>cf) function body가 return문 하나면 return, ; 생략가능

- ***map*** 도 built-in array method
	- parameter로 받은 method에 해당하는 것만 
	```javascript
	console.log(rtlScripts.map(s=>s.name));
	```
### Summarizing with Reduce
- array의 한 요소와 현재 value를 반복적으로 계산해서 하나의 single value를 산출
- 이 패턴을 reduce, or fold라고 부름
- 모든 요소들을 돌면서 현재 value와 값을 합침
- array 모든 element 의 sum 구하기
	```javascript
	function reduce(array, combine, start) {
		let current = start; //시작 값
		for(let element of array) {
			current = combine(current, element);
		}
		return current;
	}
	
	console.log(reduce([1,2,3,4], (a, b) => a + b,  0));
	```

- ***reduce*** : standard array method
	- _start_ argument 는 생략 가능
	- 생략시엔 array의 첫번째 element 를 start value로 사용
	
- SCRIPTS의 요소 중 가장 많은 character를 가진 요소를 찾기
	- characterCount 안의 reduce : 각 element의 character 개수
	- 출력에서 reduce : 반복적으로 비교하여 가장 큰 요소를 구함
	```javascript
	function characterCount(script) {
		return script.ranges.reduce(
			(count, [from, to]) => {
				return count + (to - from);
			}, 0);
	}	
	
	console.log(SCRIPTS.reduce((a, b) => {
		return characterCount(a) > characterCount(b)? a : b;
	}));
	```
	> 가장 character가 많은 script 언어가 출력됨

### Composability
- higher-order function 없이도 readable한 코드 만들 수 있다
	- another way to get the biggest character number script
	```javascript
	let biggest = null;
	for(let script of SCRIPTS) {
		if(biggest == null ||
		characterCount(biggest) < characterCount(script) {
			biggest = script;
		}
	}
	console.log(biggest);
	```
- higher-order function이 유용하게 쓰일 때는 operation을 합쳐야 할 때임
- living & dead script의 평균 origin year 찾기
	```javascript
	function average(array) {
		return array.reduce((a, b) => a + b) / array.length; // sum/size
	}
	
	console.log("average year of living scripts");
	console.log(Math.round(
				average(SCRIPTS.filter(s => s.living).map(s => s.year))
				));
	console.log("average year of dead scripts");
	console.log(Math.round(
				average(SCRIPTS.filter(s => !s.living).map(s => s.year))
				));
	```
	> 1. filter로 living/dead 거르고 2. 그 요소중에 year만 뽑아서 3. average 구함

- SCRIPTS의 요소 하나하나 돌면서 구할 수도 있지만 무엇이 , 어떻게 계산되는지 보기는 어렵다
- array 개수가 커질수록, 연산이 많을 수록 덜 abstract 디자인이 속도가 높다

### String and Character Codes
- 주어진 character code가 속한 script를 찾기
	```javascript
	function characterScript(code) {
		for(let script of SCRIPTS){
			if(script.ranges.some( ([from, to]) => { return code >= from && code < to;
			})) {
				return script;
			}
		}
		// 포함되는 script가 없는 경우
		return null;
	}
	
	console.log(characterScript(121));
	```
	> _SCRIPTS_의 각 요소 별 ranges 값 중에 주어진 character code를 포함하는게 하나라도 있으면, 그때의 요소를 반환 
	
- ***some(_판별식)*** 
	- array의 요소가 판별식을 통과할 때 까지 실행
	- 요소가 판별식 통과(true)이면 some은 바로 true 반환
	- 모든 요소에서 false일 경우 false를 반환
	```javascript
	// 배열 요소 중 하나라도 10보다 큰게 있는지 판별
	[2, 5, 8, 9].some(element => element > 10);
	// false
	[3,11, 2, 10].some(element => element > 10);
	// true
	```


- JavaScript는 character 표현에 16 bit를 씀 = ***UTF-16***
- 16 bit = ***1 unit***
- 흔히 쓰이는 character 는 1 unit으로 표현가능하지만
- 자주 안쓰이는 character는 2 unit으로만 표현
- length property나 []사용한 접근은 한개의 code unit을 통해서만 가능
- 

### Summary
- filter
- map
- reduce
- some
- 
