
# C++
SoloLearn (C++)
## Dynamic Memory
- **C++에서 memory는 두개의 part로 나뉜다**
	- ***the stack*** : local variable 가 저장되는 memory
	- ***the heap*** : 프로그램이 실행됨에 따라 동적으로 할당되는 unused memory 부분
	<br>
- **동적으로 variable 선언하여 memory 할당하기**
	- **new**  keyword 사용
	```c++
	int *p = new int;
	*p = 5;
	```
	> 크기가 int인 memory를 할당하여, 그 주소를 pointer p에 넣는다.
	- 여기서 포인터 p는 stack memory에 있는 local variable
	- 포인터 p는 heap memory에 int 사이즈의 address를 value로 갖고 있다.
	- 5는 heap memory에 있음
	- Stack( 000x - p )  / Heap int크기 000y 안에 5가 있고, p는 000y 값을 가지는..
<br>

- **동적으로 할당된 memory를 free**
	- ***delete*** keyword 사용하여 더이상 사용하지 않는 heap memory공간을 놓아줌
	```c++
	int *p = new int; //request memory
	*p = 5; //store value
	cout << *p << endl; // use value
	
	delete p; // free up the heap memory
	```
<br>

-  **Dangling Pointer**
	- 존재하지 않는(non-existent) 메모리 주소를 가지고 있는 pointer를 이르는 말.
	- heap memory를 free하면, 
		- pointer에 value로 들어있던 할당된 heap memory의 주소(address)가 hold하던 공간이 없어지는 것
		- pointer 변수는 stack memory에 있으므로 pointer 변수가 없어지는 것이 아니다. pointer 변수가 가리키던 공간이 없어지는 것.
	```c++
	int *p = new int; //request memory
	*p = 10; //store value
	cout << *p << endl; //use it
	delete p; //free up the memory
	// now p is a dangling pointer

	p = new int; // reuse for a new address
	```

	- pointer 선언시에 **NULL**을 할당해 주는 것이 권장됨.
		- 혹시 모를 의도하지 않은 주소로 참조되는 것을 방지하는 목적
	```c++
	int *ptr = NULL;
	```
	> NULL = null pointer
	
- **Dynamic Allocation for Array**
	```c++
	int *p = NULL; // pointer initialized with NULL
	
	p = new int[20] // request memory of size 20 array

	delete p[]; // delete array pointed by p
	```
## SizeOf() Operator
![enter image description here](https://api.sololearn.com/DownloadFile?id=2460)
> c++ basic data type
```c++
//syntax
sizeof(data type);


cout<< "char: " << sizeof(char) << endl;
cout << "int: " << sizeof(int) << endl;  
cout << "float: " << sizeof(float) << endl;  
cout << "double: " << sizeof(double) << endl;  
int var = 50;  
cout << "var: " << sizeof(var) << endl;  
  
/* Outputs  
char: 1  
int: 4  
float: 4  
double: 8  
var: 4  
*/
```

- **Size of Array**
	```c++
	double arr[10];
	cout<< sizeof(arr) << endl;
	// output : 80
	```
	> double: 8 bytes * 10 = 80 = sizeof(arr)
	```c++
	double nums[100];
	cout<< sizeof(nums) / sizeof(nums[0]);
	// 전체 크기/요소 하나 크기 = 배열 크기
	```

## Function
- ***iostream*** : defines the standard stream that input and output data
	```c++
	#include <iostream>
	using namespace std;
	```
- function은 main 함수 전에 선언되던지, 정의 되어있어야 함
	- 선언 (declaration) : 이름만 적어놓는 것
	- 정의(definition) : 함수의 body까지 있는 것

## The rand() Function
- ***cstdlib*** : rand() function이 정의된 header. C++의 standard library
	```c++
	#include <iostream>
	#include <cstdlib>

	using namespace std;  
  
	int main() {  
	cout << rand();  
	}
	```
- **일정 범위의 random number 생성하기**
	- ***modulo(%)***를 사용하면 됨
	```c++
	// random number between 1~6
	cout<< 1 + ( rand() % 6 ) ;
	```
	>x % 6 : 0~5 
	
- **srand() function**
	- srand(parameter) 는 parameter를 기준으로 진정한 난수를 생성해준다.
	- rand는 srand로 인해 생성된 값을 기준으로 난수를 생성
	- `srand()` 는 (의사) 난수 생성기를 시드하기위한 C 표준 라이브러리 구현입니다.
- **Truly Random Number**
	- srand() 함수의 seed value로 현재 시간을 넣어주면 truly random한 숫자를 얻을 수 있다.
	- `time()` : 현재 시간을 얻을 수 있는 함수 (`<ctime>` library)
	```c++
	#include <iostream>
	#include <cstdlib>
	#include <ctime>
	using namespace std;
	
	int main() {
		srand(time(0));
		// time(0) 은 현재시간을 초로 return
		for(int i = 0; i < 10; i++) {
			cout<< 1 + (rand() % 6) << endl;
		}
		return 0;
	}
	```
## Default Parameter
- function definition에서 default parameter 설정 가능
```c++
int multiplyValue(int a=1, int b=1, int c=1) {
	return a * b * c;
}

int main() {
	cout<< multiplyValue() << endl; // 1
	cout<< multiplyValue(2) << endl; // 2*1*1 = 2
	cout<< multiplyValue(2, 3) << endl; // 2*3*1 = 6
	cout<< multiplyValue(3,4,5) << endl; // 3*4*5 = 60
	return 0;
}
```
## Overloading
- 같은 점 : function 이름, return type
- 다른 점 : parameter의 type이나 개수

## Recursion
- 함수 자기자신을 call하는 것
- factorial function
	```c++
	int factorial(int n) {
		if(n == 1) { //exit condition
			return 1;
		} else {
			return n * factorial(n-1);
		}
	}
	```
	> exit condition = base case : recursion에 필수. 없으면 무한 call..


## Passing Arrays to Function
- parameter에 array넘기려면 함수 정의에서 array 이름 뒤에 [] 꼭 붙여야 함
- 함수 call할 땐, 그냥 array 이름만
	```c++
	int sum(int arr[], int size) {
		int result = 0;
		for(int i = 0; i < size; i++) {
			result += arr[i];
		}
		return result;
	}
	
	int main() {
		int myArr = {2, 4, 6};
		cout<< sum(myArray, 3) << endl;
		return 0;
	}
	```
## Pass by Reference with Pointer
- function call 할 때, 변수의 값이 아닌 변수의 address가 넘어가서 함수안에서 조작시 실제 변수가 변동
	```c++
	void myFunction(int *pv) { //pointer 변수로 주소를 넘겨받음
		*pv += 10; //dereferce 
	}
	
	int main() {
		int var = 10;
		myFunction(&var); 
		cout << var <<endl; // 20
		return 0;
	}
	```

## Abstraction
Data **abstraction** is the concept of providing only essential information to the outside world. It's a process of representing essential features **without including implementation details**.
내부 구현 내용을 보여주지 않고 필요한 정보만 제공하는 개념

- 특정 instance과 완전 분리된 개념
- ***cout***  : ***iostream*** 에 정의된 class로 만든 object
	- cout의 안의 세부 구현 내용은 몰라도 어떤 일을 하는지 알고 사용 가능하다.
- inheritance, polymorphism 의 기본이 되는 개념

## Seperate Files for Classes
header & source file 나눠서 생성
- header file (.h) : 함수와 변수 선언 (prototypes)
	```c++
	//MyClass.h
	#ifndef MYCLASS_H  
	#define MYCLASS_H  
	  
	class MyClass  
	{  
		public:  
			MyClass();  
		protected:  
		private:  
	};  
	  
	#endif // MYCLASS_H
	```
- source file (.cpp) : class구현
	```c++
	//MyClass.cpp
	#include "MyClass.h"

	MyClass::MyClass() {
		//constructor
	}
	```
	
