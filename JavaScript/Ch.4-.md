# Data Structures : Objects and Arrays
> story : 주인공(Jacques)이 squirrel 아니면 wolf로 변할 수 있는데 변하는데 있어서 특정 패턴을 찾으려고 함.
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
- myString.length : myString이라는 value의 length property에 접근
- null, undefined 제외하고는 JavaScript의 거의 모든 value는 property 有
```javascript
null.length;
// TypeError : null has no properties
```
> nonvalue의 property는 없으므로 접근시 에러남

- 접근방법 2가지 : value.x / value[x]
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

- array 의 method : push, pop (like stack)
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
- object : arbitrary collections of properties
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
- delete : 단항 연산자. property를 object로부터 삭제
- in : string in object - object에 string 이름의 property가 있으면 true, 아니면 false return
```javascript
let anObject = {left: 1, right: 2};
console.log(anObject.left);
// left
delete anObject.left;
console.log(anObject.left);
// undefined
console.log("left" in anObject);
// false
console.log("right" in anObject);
// right
```
- Object.keys : 해당 object의 property 이름들을 string array로 return
```javascript
console.log(Objects.keys({x: 0, y: 0, z: 2}));
// ["x", "y", "z"]
```
- Object.assign(obj1, obj2) : obj2에 있는 property를 모두 복사하여 obj1에 넣기
```javascript
let objA = {a: 1, b: 2};
Object.assign(objA, {b: 3, c: 4});
console.log(objA);
// {a: 1, b: 3, c: 4}
```
### Mutability
- numbers, strings, booleans : ***immutable*** = impossible to change values of those types
- object : ***mutable*** = possible to change properties
- object 선언시에 let과 const는 object 객체가 변하지 않는다는 의이므로, object 안의 contents는 변할 수도 있다.
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
addEntry(["work", "touched tree", "pizza", "running",
          "television"], false);
addEntry(["work", "ice cream", "cauliflower", "lasagna",
          "touched tree", "brushed teeth"], false);
addEntry(["weekend", "cycling", "break", "peanuts",
          "beer"], true);
```
- Jacques 는 충분히 data가 모이면 이를 바탕으로 squirrel이 되는 상관관계 통계를 내려고 함
- Correlation(상관계수)
	- -1 ~ 1 사이의 값을 가짐
	- 


