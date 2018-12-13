# JavaScript 
> Eloquent JavaScript Summary!
> [Go Study JavaScript!] (http://eloquentjavascript.net/)
<br>

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
	```
