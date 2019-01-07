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
