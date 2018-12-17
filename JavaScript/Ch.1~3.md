


> Written with [StackEdit](https://stackedit.io/).

## INTRODUCTION
-  JAVA랑 관련 1도 없음
- 가장 최근 버전 : 2015년에 나온 ECMAScript version 6
- JavaScript는 웹브라우저 이외에도 다양한 곳에서 사용됨
	-  MongoDB, CouchDB
	- Node.js for desktop and server programming
    

  

## Ch 1. Values, Types, and Operators

-   Special Numbers (3가지)
    -   **Infinity** / **-Infinity  **
    (Infinity-1 = Infinity)
    -   **NaN** : not a number (무의미한 연산의 결과를 의미)
-   Strings
    -   쌍따옴표(double quotes), 홑따옴표(single quotes), `(backtrics) 싸고 있는 text를 의미
    -  \+ 연산 사용가능 (string 합치는 용도, concatenate)
-   newlines(줄바꿈)
    -   backtricks안에서 그냥 enter 치면 됨
    -   나머지 quotes에서는 escape문자(\n) 사용해서 표현해야 한다.
    
    
-  backtrick -> template literal
    -   ${} : template literal - {} 안에 넣으면 연산해서 string으로 변환해서 그 자리에 넣어줌
    ```javascript 
    console.log(`half of 100 is ${100 / 2}`);
    // half of 100 is 50
    ```  
<br>

-   Unary Operators (단항연산자)
     ```javascript
    console.log(typeof 4.5);
    // number
    console.log(typeof "x");
    // string
    ```
<br>   

- Boolean Values
	- true / false
	- 논리 연산의 결과 값
    ```javascript
    console.log("Aardvark" < "Zoroaster");
    // → true
    ```
    > 문자열 비교시 alphabetic 순서에 의해 결정됨  
    “Z” < “a” (대문자가 소문자보다 값이 작음)  
    대문자< 소문자 < nonalphabetic characters
    ```javascript
    console.log(NaN == NaN);
    // false
    ```
    > NaN은 무의미한 연산의 결과를 의미함 
    -> 어떤 연산과도 같지 않음

<br>

-   Empty Values : absence of a meaningful value
	- null & undefined
-   Automatic Type Conversion (자동형변환)
    ```javascript
    console.log(8 * null);
    // 0 : null -> 0으로 자동 형 변환됨
    console.log("five" * 2);
    //NaN
    ```
    ```javascript
    console.log(false == 0);
    //true 
    console.log(false == "");
    //true
    ```
    > true 1 / false 0
    ```javascript
    console.log(null = undefined);
    //true;
    console.log(null == 0);
    // false
    ```
<br>

-   Short-Circuiting of Logical Operators (|| &&)
	- ***A || B*** : A가 비어있으면 B로 대체하는 기능
    A가 false이면 B를 return
     A가 true이면 A를 return
     ```javascript
     console.log(null || "user");
     // user
     console.log("Agnes" || "user");
     // Agnes
     console.log(0 || -1);
     // -1
     console.log("" || "!?");
     // !?
     ```
     > 0, NaN, "" 은 false로 간주
    -  ***A && B*** : A가 false이면 A를 return, true면 B를 return
    

  

## Ch2. Program Structure

-   Expression & Statement
	- expression : valule를 생산해내는 코드
	- expression > statement > program
-   Bindings (=Variable)
	```javascript
	let x = 5 * 5;
	```  
	-   binding != value를 가지고 있는 것
	-  binding == value값과 연결하는 것
	-  빈 binding에 value요청시 undefined 나옴
    ```javascript
    var name = "Ayda";
    //2015년 이전 버전에서 변수 선언시 사용
    const greeting = "Hello";
    //상수 선언
    console.log(greeting + name);
    // Hello Ayda
    ```
<br>

-   Binding Names   
	- 맨앞에 $, _ 이외의 다른 특수문자 불가
	- 예약된 keyword 불가 
    
-   Environment
    -   주어진 시간에 binding과 value가 존재하는 것..
    

-   Function
    -   invoking, calling, applying
    -   argument
    

-   The **console.log** Function
	-    argument을 text로 console에 찍어줌
	-  console이란 binding의 value로부터 log라는 property를 불러오는 것
   
-   Return Values     
	- side effects : dialog box 보여주기, 스크린에 text 쓰기 등
    ```javascript
    console.log(Math.max(2, 4);
    // 4
    console.log(Math.min(2, 4) + 100);
    // 102
    ```
<br>

-   Control Flow
    ```javascript
    let theNumber = Number(prompt("Pick a number"));
    //Number(x) : argument를 숫자로 변환해줌
    console.log("Your number is the square root of " + theNumber * theNumber);
    ```
    > prompt가 string return -> Number 함수가 숫자로 변환

-   Conditional Execution
	-  if, while, do while 관련
    ```javascript
    let theNumber = Number(prompt("Pick a number"));

	if(!Number.isNaN(theNumber)) { //theNumber가 숫자인 경우
		console.log("Your number is the square root of " + theNumber * theNumber);
	}
    ```

-   Indenting Code
    <br>
-   For Loops
    <br>
-   Breaking Out of Loop
	- break
    -   continue
  
-   Updating Bindings Succinctly (간결하게)
	-   += , -= 사용 가능
<br>    
-   Dispatching On a Value With Switch
    -   switch
    -   default
    -   break
   
<br>

-   Capitalization
	- camel 방식 변수 이름    
<br>

-   Comments 주석
    -   //, /* */
    

  

## Ch3. Functions

- Defining a Function
	- function을 정의하는 세가지 방법이 있음 
	- **function** 키워드 사용
	```javascript
	const square = function(x) {
		return x * x
	}
	console.log(square(12));
	/
	```
	> value를 return 하는 함수
	```javascript
	const makeNoise = function() {
		console.log("Pling!");
	}
	makeNoise();
	//Pling!
	```
	> side effect 만 있는 함수
	
<br>

- Bindings and Scopes
	- scope : 프로그램에서 binding이 visible한 범위, 부분
	- ***global*** or ***local***
	```javascript
	let x = 10;
	if (true) {
		let y = 20;
		var z = 30;
		console.log(x + y + z);
		// 60
	}
	
	console.log(x + y + z);
	// y is not visible here
	// ReferenceError : y is not defined
	
	console.log(x + z);
	// 40	
	```
<br>

- Nested Scope
	```javascript
	const hummus = function(factor){
		const ingredient = function(amount, unit, name) {
			let ingredientAmount = amount * factor;
			if(ingredientAmount > 1) {
				unit += "s";
			}
			console.log(`${ingredientAmount} ${unit} ${name}`);
		};
		ingredient(1, "can", "chickpeas");
		ingredient(0.25, "cup", "tahini");
	    ingredient(0.25, "cup", "lemon juice");
	    ingredient(1, "clove", "garlic");
	    ingredient(2, "tablespoon", "olive oil");
	    ingredient(0.5, "teaspoon", "cumin");
	};
	
	hummus(2);
	/* 2 cans of chick peas 
	   0.5 cvup tahini .... */
	```
	> ingredient function은 factor binding 볼 수 있음
	ingredientAmount 는 내부 function에서는 visible, outer function(hummus) 에서는 invisible.

- Functions as Values
	- function binding 은 주로 한번 정의되면 절대 바뀌지 않음
	- function binding은 일반 binding처럼 바뀔수도 있음 
	```javascript
	let launchMissiles = function() {
		missileSystem.launch("now");
	};
	
	if(safeMode) {
		launchMissiles = function() {/* do nothing*/};
	}
	```
	> function binding 을 const가 아닌 let으로 선언시 바꿀 수 있다.

- Declaration Notation
	- function declaration  :  선언된 위치에 상관 없이 함수 사용 가능!)일반적인 top to bottom 방향의 control이 아님
	- 개념적으로 scope의 가장 위에 있음
	```javascript
	consoe.log("The future says:", future());
	
	function future() {
		return "You'll get the job you want";
	}
	```
- Arrow Functions
	- function keyword 대신에 arrow(=>) 사용하여 함수 정의
	```javascript
	const power = (base, exponent) => {
		let result = 1;
		for(let count = 0; count < exponent; count++){
			result *= base;
		}
		return result;
	};
	```
	> parameter 다음에 => 붙이고 function body 
	   ~ input ~ produces this result (the body)
	   
	```javascript
	const square1 = (x) => { return x * x;};
	const square2 = x => x * x;
	```
	> parameter 가 한개면 괄호 생략 가능
	> body가 single expression이면 {} 생략. 해당 expression이 value를 return

	```jacascript
	const sayHello = () => {
		console.log("Hello");
	};
	```
	> parameter가 없는 경우 - 빈 ( ) 넣기

- The Call Stack
	- computer가 현재 context를 저장하는 곳을 의미
	- 현재 context가 stack의 top에 위치
	- function에서 return하면 top을 pop하고 그 다음 top의 context에서 계속 진행~
	```javascript
	function greet(who) {
		console.log("Hello " + who);
	}
	greet("Diana");
	console.log("Bye");
	```
	> the flow of control
	not in function
		in greet
			in console.log
		in greet
	not in function
		in console.log
	not in function
	- stack 이 너무 커질 경우 fail message
	- out of stack space, too much recursion
<br>
- Optional Argument
	- JavaScript에서는 정해진 수보다 많이 parameter넘기면 남는 애들은 ignored,
	- 적게 넘어가면 빠진 애들은 undefined로 넘어감
	```javascript
	function minus(a, b){
		if(b == undefined) { //b가 안들어온 경우
			return -a;
		} else {
			return a - b;
		}
	}

	console.log(minus(10));
	// -10
	console.log(minus(10, 5));
	// 10 - 5 = 5
	```
	- 값이 주어지지 않았을 때, default로 설정될 값을 주는 방법
	```javascript
	function power(base, exponent = 2) {
		let result = 1;
		for(let count = 0; count < exponent; count++) {
			result *= base;
		}
		return result;
	}
	console.log(power(4));
	// 4^2 = 16
	console.log(power(2, 6));
	// 2^6 = 64
	```

<br>

- Closure
	- 함수가 불릴때의 binding environment가 아닌 함수가 만들어질 때의 environment 를 본다
> [참조](https://hyunseob.github.io/2016/08/30/javascript-closure/) 
```javascript
function wrapValue(n) {
	let local = n;
	return () => local;
}

let wrap1 = wrapValue(1);
let wrap2 = wrapValue(2);
console.log(wrap1());
// 1
console.log(wrap2());
// 2
```
> This feature—being able to reference a specific instance of a local binding in an enclosing scope—is called _closure_. A function that references bindings from local scopes around it is called _a_ closure. This behavior not only frees you from having to worry about lifetimes of bindings but also makes it possible to use function values in some creative ways.

```javascript
function multiplier(factor) {
	return number => number * factor;
}

let twice = multiplier(2));
// 2배 해주는 함수를 반환
console.log(twice(5));
// 5 * 2 = 10
```
<br>

- Recursion
	- 자기 자신을 호출하는 function
	```javascript
	function power(base, exponent) {
		if (exponent == 0) {
			return 1;
		} else {
			return base * pwer(base, exponent -1);
		}
	}
	
	console.log(power(2, 3);
	// 2^3 = 8
	```
	>loop 도는 것 보다 확실하게 개념을 설명할 수 있다.
	
	- puzzle : 1에서 시작해서 5를 더하거나, 3을 곱해서 특정 숫자를 얼마만에 구할 수 있는지?
	```javascript
	function findSolution(target) {
		function find(current, history) {
			if(current == target) {
				return history;
			} else if (current > target) {
				return null;
			} else {
				return find(current + 5, `(${history} + 5)`) || find(current * 3, `(${history} + 5)`);
			}
		}
		return find(1, "1");
	}
	
	console.log(findSolution(24));
	
	```
	> return find... || find ...  (왼쪽이 null이면 오른쪽을 return)
	둘다 null일 경우(답 없음) null return
	
	- flow ( findSolution(13) )
	1. find(1, "1")
	2. find(6, "(1+5)")
	3. find(11, "((1+5) + 5)")
	4. find(16, "(((1+5)+5)+5)")  -> too big
	5. find(33, "(((1+5) + 5)*3)" )   (3에서 *3)  -> too big
	6. find(18, "((1+5)*3)")  (2에서 *3)  -> too big
	7. find(3, "1*3")
	8. find(8, "((1*3)+5)")
	9. find(13, "(((1*3)+5)+5)")  -> found!
<br>
- Growing Functions
	- 함수를 점점 다목적의, 확장 가능한 함수로 바꾸는 원리
	```javascript
	function printFarmInventory(cows, chickens) {
		let cowString = String(cows); //문자열로 변환
		while(cowString.length < 3) {
			cowString = "0" + cowString;
		}
		console.log(`${cowString} Cows`);
		let chickenString = String(chickens); //문자열로 변환
		while(chickenString.length < 3) {
			chickenString = "0" + chickenString ;
		}
		console.log(`${chickenString} Chickens`);
	}
	printFarmInventory(7, 11);
	/* 007 Cows
	   011 Chickens */
	```
	> 초기 함수 -> 확장 불가능
	```javascript
	function printZeroPaddedWithLabel(number, label){
		let numberString = String(number);
		while(numberString.length < 3) {
			numberString = "0" + numberString;
		}
		console.log(`${numberString} ${label}`);
	}
	
	function printFarmInventory(cows, chickens, pigs){
		printZeroPaddedWithLabel(cows, "Cows");
		printZeroPaddedWithLabel(chickes, "Chickens");
		printZeroPaddedWithLabel(pigs, "Pigs");
	}
	
	printFarmInventory(7, 11, 3);
	```
	> pigs 추가로 인해 0 넣는 부분을 따로 모듈화 함
	printZeroPaddedWithLabel 함수가 0도 붙이고, print도 하는 두가지 일을 함
	
	```javascript
	function zeroPad(number, width) {
		let string = String(number);
		while(string.length < width) {
			string = "0" + string;
		}
		return string;
	}
	
	function printFarmInventory(cows, chickens, pigs){
		console.log(`${zeroPad(cows, 3)} Cows`);
		console.log(`${zeroPad(chickens, 3)} Chickens`);
		console.log(`${zeroPad(pigs, 3)} Pigs`);
	}
	
	printFarmInventory(7, 16, 3);
	```
	> single concept으로 바꿈. 더 알아보기 쉽게
	
	
	- Functions and Side Effects
		- 단순히 value를 create하는 function이 side effects를 포함하는 function보다 다른 방식으로 combine되기 쉽다
		- pure function : side effect를 포함하지 않고, 다른 코드의 side effect 에 의존하지 않는다 (ex. 변할지도 모르는 global binding을 읽는...)

<br>

- Summary
	- function을 정의하는 세가지 방법
	```javascript
	// 1
	const f = function(a) {
		console.log(a+2);
	};
	// 2
	function g(a, b) {
		return a * b * 3.5;
	}
	// 3 parameter a를 받아 a%3을 return 하는 함수
	let h = a => a % 3;
	```
	
- Excercises
	- Minimum : two argument -> return minimum
	```javascript
	function min(a, b) {
		if(a > b) 
			return b;
		else
			return a;
	}	
	console.log(min(0, 10));
	// 0
	console.log(min(0, -10));
	// -10
	```
	- Recursion : argument가 even인지 odd인지 판단하는 함수를 작성
		- recursion 사용하여 구현하려면...
			- 0 은 even
			- 1은 odd
			- 그외 숫자들을 N이라 하면 N-2도 even/odd
	```javascript
	function isEven(n) {
		if(n == 0) {
			return true;
		} else if(n == 1){
			return false;
		} else if(n < 0) {
			return isEven(-n);
		} else {
			return isEven(n-2);
		}
	}
	console.log(isEven(50));
	// → true
	console.log(isEven(75));
	// → false
	```
	- Bean Counting : String argument의 B의 개수 / char 의 개수를 세는 함수 작성하기
	```javascript
	//countBs : "B"의 개수 세기
	const countBs = function(str) {
		let count = 0;
		for(let i = 0; i < str.length; i++){
			if(str[i] == "B")
				count++;
		}
		return count;
	};
	console.log(countBs("BBC");
	// 2
	
	const countChar = (str, char) => {
		let count = 0;
		for(let i = 0 ; i < str.length; i++){
			if(str[i] == char)
				count++;
		}
		return count;
	};
	console.log(countChar("kakkerlak", "k"));
	// 4
	```
	> string[N] 사용하면 N번째 자리의 character를 얻을 수 있다
