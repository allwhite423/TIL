
# C++
SoloLearn (C++)
## Dynamic Memory
- **C++에서 memory는 두개의 part로 나뉜다**
	- ***the stack*** : local variable 가 저장되는 memory
	- ***the heap*** : 프로그램이 실행됨에 따라 동적으로 할당되는 unused memory 부분
	<br>
- **동적으로 variable 선언하여 memory 할당하기**
	- ***new***  keyword 사용
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
- ex)  ***cout***  : ***iostream*** 에 정의된 class로 만든 object
	- cout의 안의 세부 구현 내용은 몰라도 어떤 일을 하는지 알고 사용 가능하다.
- **inheritance, polymorphism** 의 기본이 되는 개념

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
	};  // class 정의 뒤에 semicolon(;) 꼭 붙이기!
	  
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

<br>

- Scope Solution Operator ::
	- class의 member function을 정의할 때 사용
	- class는 header file에 미리 선언되어 있어야 함
	- header file에는 class, class의 함수, class 변수 등 모든 **선언**이 있음

- header : what / cpp source : how

## Destructor
- object가 deleted / destroyed 될 때 call 되는 함수
- constructor처럼 class이름이랑 같고, 앞에 tilde(~)를 붙여줌
	```c++
	class MyClass{
		public: 
			MyClass() { //constructor
				//called when an object is created
			}
			~MyClass(){  //destructor
			  //~~
			}
	}
	```
- in header file
	```c++
	// MyClass.h
	class MyClass {
		public:
			MyClass();
			~MyClass();
	};
	```
- in source file
	```c++
	// MyClass.cpp
	#include "MyClass.h"
	#include <iostream>
	using namespace std;
	
	MyClass::MyClass() {
		cout<< "Constructor" << endl;
	}
	MyClass::~MyClass() {
		cout<< "Destructor" << endl;
	}
	```
- destructor 에는 parameter 없음 => overloading 불가 => 클래스 당 destructor는 오직 한개
- destructor 정의는 필수 아님

<br>

- program 실행에 따른 object 생성과 소멸
	```c++
	#include <iostream>  
	#include "MyClass.h"
	using namespace std;  
  
	int main() {  
		MyClass obj;  // object 생성 -> constructor called
  
		return 0;  
	}
	```
	- 프로그램 실행 끝날 때, object 삭제되고, destructor called

## #ifndef, #define
- ***ifndef*** = ***"if not defined"***
	- 정의되어있지 않다면, 정의해라
	- 프로그램에게 해당 헤더파일이 정의되어 있지 않다면, 정의하라고 시키는 역할
	- 한 파일에서 헤더파일이 한 번 이상 포함되는 것을 방지하기 위함
- ***endif*** = ***end the condition***
	```c++
	#ifndef MYCLASS_H
	#define MYCLASS_H
	
	class MyClass {
		public:
		MyClass();
		protected:
		private:
	};
	
	#endif
	```

## Selection Operator
- **Member Function**
	- 선언, 정의 둘다 return type 명시해야 함
	- void myPrint() 함수 선언, 정의 
	```c++
	//MyClass.h
	class MyClass{
		public: 
		MyClass();
		void myPrint();
		protected:
		private:
	};
	```
	```c++
	//MyClass.cpp
	#include "MyClass.h"
	#include <iostream>
	using namespace std;
	
	MyClass::MyClass() {
	
	}

	void MyClass::myPrint() {
		cout<< "Hello" << endl;
	} 
	```
	> return type 명시 위치 주의
- Dot Operator (**.**): object 변수가 function 사용시
	```c++
	#include "MyClass.h"
	int main() {
		MyClass obj; //객체 생성
		obj.myPrint(); //function call
	}
	```
- Selection Operator (**->**) : 객체 포인터에서 function 사용시
	```c++
	#include "MyClass.h"
	int main() {
		MyClass obj; //객체 생성
		MyClass *ptr = &obj; // 객체 obj를 가리키는 MyClass type pointer ptr에 obj의 address 할당
		obj.myPrint(); 
		ptr->myPrint(); 
	}
	```
	> function call 결과 두개 같음

## Const Objects
- constant : 고정된 value를 가지고 있는 expression
- 프로그램 수행 중에는 바뀔 수 없음
- ***const*** keyword 사용
	```c++
	const int x = 15;
	```
- **생성시에 꼭 초기화(initialize) 되어야 함**
	- object 의 경우 const 로 선언되면 constructor를 통해 초기화 된다
	- 일단 한번 const class object가 생성되면, 해당 object의 **member 변수를 바꿀 수 없다.**
	- public function 등을 통해서도 멤버 변수 바꿀 수 없음
	```c++
		const MyClass obj;
	```
	
- const object 는 **constant function 만** 사용 가능
- non-const object는 constant function 사용 불가
- const function : function 이름 괄호 뒤에 const keyword 붙임
	```c++
	//MyClass.h
	class MyClass{
		public: 
			void myPrint() const;
	};
	```
	```c++
	//MyClass.cpp
	#include "MyClass.h"
	#include <iostream>
	using namespace std;
	
	void MyClass::myPrint() const {
		cout<< "this is a const function" << endl;
	};
	
	int main() {
		const MyClass obj;
		// const로 선언한 object 변수만 const function 사용 가능
		obj.myPrint();
	}
	```

## Member Initializers
- **member initialization list**
	- class의 const member variable을 construtor에서 초기화 하는 용도로 사용
	- const variable은 선언 후에 다른 value를 다시 할당하는게 허용되지 않기 때문!
	- constructor 함수의 parameter 뒤에 colon(:) 붙이고 명시해주면 됨
	```c++
	class MyClass{
		public: 
			MyClass(int r, int c) {
				regVar = r;
				constVar = c; // error
			}
		private:
			int regVar;
			const int constVar; 
	};
	```
	> error - const 변수는 선언 후에 다른 value 할당 불가
	
	```c++
	class MyClass{
		public: 
			MyClass(int r, int c) 
			: regVar(r), constVar(c){ // member initializaion list used
			}
		private:
			int regVar;
			const int constVar; 
	};
	```
	> member initializaion list로 해결 가능

- example) header , source 
	```c++
	// MyClass.h
	class MyClass {
		public:
			MyClass(int a, int b);
		private:
			int regVar;
			const int constVar;
	};
	```
	
	```c++
	// MyClass.cpp
	#include "MyClass.h"
	MyClass::MyClass(int a, int b)
	: regVar(a), constVar(b) {
		cout << regVar << endl;
		cout << constVar << endl;
	}
	```
	
	```c++
	#include "MyClass.h"
	int main() {
		MyClass obj(42, 33); //constructor에 parameter 넘김
	}
	```
	> output : 
	42
	33

- member initialization list는 const variable 초기화 할 때만 쓰여야 함
	- 일반 변수 초기화에도 쓰일 수는 있음 

## Composition
- Class 의 member 변수로 다른 class를 사용 가능
- ex) class Person 의 member로 class Birthday type을 사용
	```c++
	//Birthday.h
	class Birthday {
		public:
			Birthday(int y, int m, int d)
			: year(y), month(m), day(d) 
			{
			}
			void printDate() {
				cout << month << "/" << 
				day << "/" << year << endl;
			}
		private:
			int year;
			int month;
			int day;
	};
	```
	```c++
	// Person.h
	#include <string>
	#include "Birthday.h"
	
	class Person {
		public:
			Person(string n, Birthday b)
			: name(n), bday(b)
			{
			}
			void printInfo() {
				cout << name << endl;
				bday.printDate();
			}
		private:
			string name;
			Birthday bday;
	};
	```
	```c++
	#include "Person.h"
	
	int main() {
		Birthday bd(1993, 9, 5);
		Person me("Diana", bd);
		me.printInfo();
		
		return 0;
	}
	```
	> output:
	Diana
	9/5/1993
	
## Friend keyword	
- class에서 private으로 선언된 변수나 함수는 외부에서 접근 불가
- friend 관계의 class끼리는 private에서 friend keyword가 붙은 멤버에 한해 접근 가능
- 기존의 접근 지정자를 무시할 수 있는 예외적 기능
- 정보 은닉 개념에 위배됨
- friend 관계의 class에겐 friend 멤버는 public처럼 작용
- 당하는 class에서 friend될 class를 선언 : 허락의 의미
	- class A에서 class B를 friend로 선언 = A는 B의 것!
	- B에게 정보를 털려두 괜찮다는 의미
- [참조링크](http://genesis8.tistory.com/98)
- 좀더 공부 필요함

##  This keyword
- member function 안에서 this 는 불려진 object 자신을 가리키는 **pointer 변수** 임
- 사용시에 ***->*** or ***dereference 기호( * )*** 사용 
	```c++
	class MyClass{
		public:
			MyClass(int a): var(a) {
			}
			void printVar() {
				// 모두 같은 
				cout << var << endl;
				cout << this->var << endl;
				cout << (*this).var << endl;
			}
		private:
			int var;	
	};
	```
- friend function 에서는 ***this*** keyword 사용 불가
	- friend는 class의 member가 아니기 때문

## Operator Overloading
- 대부분의 C++ built-in operator는 redefined/overloaded 가능
	![enter image description here](https://api.sololearn.com/DownloadFile?id=2463)
	> 안되는 operator :: | .* | . | ?:
	
- ex) ***+ operator*** overloading 하기
	- ***operator*** keyword를 사용하여 해당 operator의 기능을 정의
	- +는 Classroom class의 ***capacity*** 변수를 더한 새로운 Classroom object 를 return
	```c++
	class Classroom {
		public:
			int capacity;
			Classroom() {}
			Classroom(int c): capacity(c) {}
			
			//operator + overloading
			Classroom operator+(Classroom &a) {
				Classroom res;
				res.capacity = this->capacity + a.capacity;
				return res;
			}
	};
	
	int main() {
		Classroom a(120), b(100);

		// + operator overloading
		Classroom newClassroom = a + b;
		
		cout << newClassroom.capacity <<endl;
		// 220
	}
	```
## Inheritance
- 상속은 다른 class 를 기반으로 새로운 class를 정의할 수 있도록 하는 특성
- Base Class (상위) - Derived Class (하위)
- 상속(Inheritance) 의 개념은 ***is-a*** relationship을 구현한 것
	- mammal is a animal
	- dog is a mammal
	- Thus, dog is a animal
- 상속 class 구현하기
	- class 이름 옆에 : 붙이고 접근자, 상위클래스 순서로 명시
	```c++
	#include <iostream>
	using namespace std;
	class Mother{
		public:
			Mother() {};
			void sayHi() {
				cout<< "hi" <<endl;
			}
	};
	class Daughter: public Mother {
		//all public member of Mother becomes public memeber of Daughter 
		public:
			Daughter(){};
	};
	
	int main() {
		Daughter d;
		d.sayHi();
		// output: hi
	}
	```

- 다중상속 가능 (, 로구분)
	```c++
	class Daughter: public Mother, public Father
	```
- A derived class inherits all base class methods with the following exceptions:  (상속안되는 예외들)
	- Constructors, destructors  
	- Overloaded operators  
	- The friend functions

## Protected Members (Access Specifier)
- Access Specifier

|  | access range |
|--|--|
|**Public**  | anywhere outside of class |
|**Private**  | inside of class, friend class |
|**Protected** | derived class (하위클래스) |

- Type of Inheritance
	- 상속에서도 access specifier가 사용되는데, 이에 따라 하위 클래스에서의 상위클래스 member 접근자가 결정됨
	```c++
	class Daughter : _______ Mother
	```
	**상위 클래스의 private member는 하위클래스에 상속 불가**
	
|  |base class -> derived class | 
|--|--|
|**Public**  | public->public, protected->protected|
|**Private**  | public, protected -> protected |
|**Protected** | public, protected -> private |

- 상속에서 default access specifier 는 ***private***

## Derived Class Constructor & Destructor
- 상속관계에서, 상위클래스의 constructor, destructor는 상속되지 않는다.
- 하지만, derived class 가 생성되거나 삭제될 때, 자동으로 상위클래스의 constructor, destructor가 호출됨
	```c++
	class Mother {
		public:
			Mother() {
				cout<< "Mother constructor" << endl;
			}
			~Mother() {
				cout<< "Mother destructor" << endl;
			}
	};
	
	class Daughter: public Mother{
		public:
			Daughter() {
				cout<< "Daughter constructor" << endl;
			}
			~Daughter() {
				cout<< "Daughter destructor" << endl;
			}
	};
	
	int main() {
		Daughter d;
		return 0;
	}
	/* output
	Mother constructor
	Daughter constructor
	Daughter destructor
	Mother destructor
	*/
	```
	> 생성 : 상위 클래스 -> 하위 클래스
	삭제 : 하위 클래스 -> 상위클래스

## Polymorphism (다형성)
- 상속관계에서 가능한 개념
- 하나의 함수를 호출하면 그 함수가 불린 객체에 맞게 응답하는 것
- 같은 타입이지만, 실행결과가 다양한 객체를 이용할 수 있는 성질(타입 = 부모클래스가 같음을 의미)
	- 상위클래스A, 하위클래스B 
	```c++
	class A {
		public:
		void x() {
			cout<< "A x" << endl;
		}
	};
	class B : public A {
		public:
		void x() {
			cout<< "B x" << endl;
		}
	};
	
	int main() {
		B sub;
		// B 객체 생성
		A *super = &sub;
		// A 타입 변수에 B객체 
		super->x();
		//output : "B x"
	}
	``` 
- single function, different implementation
- overloading, overriding
- example: Enemy 는 공통함수 attack을 가짐
	```c++
	class Enemy {
		protected:
		int attackPower;
		public:
		void setAttackPower(int a){
			attackPower = a;
		}
	};
	
	class Dragon: public Enemy {
		public:
		void attack() {
			cout<< "Dragon! - "<< attackPower <<endl;
		}
	};
	
	class Monster: public Enemy {
		public:
		void attack(){
			cout<< "Monster! - " << attackPower << endl;
		}
	};
	
	int main() {
		Dragon d;
		Monster m;
		
		Enemy &e1 = &d;
		Enemy &e2 = &m;
		
		e1->setAttackPower(20);
		e2->setAttackPower(90);

		d.attack();
		m.attack();
		/* output
		Dragon! - 20
		Monster! - 90
		*/
	}
	```
## Virtual Functions
- 상위 클래스에서 virtual 로 선언한 함수만 상위클래스타입 포인터로 하위클래스의 overriding한 함수를 호출 가능
- 상위클래스에서 virtual 함수로 선언
-> 하위클래스에서 해당 함수를 구현
-> 상위클래스 타입 포인터에 하위클래스 객체를 연결
-> 그 포인터로 해당 함수 call하면 하위클래스에서 구현한 함수 내용을 실행

	```c++
	#include <iostream>
	using namespace std;

	class Enemy{
		public:
			virtual void attack() {}
	};

	class Dragon {
		public:
			void attack() {
				cout<< "Dragon attack" << endl;
			}
	};

	class Monster{
		public:
			void attack() {
				cout<< "Monster attack" << endl;
			}
	};

	int main() {
		Dragon d;
		Monster m;
		Enemy *e1 = &d;
		Enemy *e2 = &m;
		
		e1->attack();
		e2->attack();
		
		/* output:
		Dragon attack
		Monster attack
		*/
	}
	```

- virtual로 선언한 함수만 실제 객체타입에 맞는 함수를 호출함
- ***polymorphic class*** : virtual function을 선언하거나 상속받은 클래스

## Abstract Class
- **Pure Virtual Function** 
	- 하위 클래스에서 구현하도록 만든 body가 없는 함수
	- virtual member function without definition
	- 하위 클래스에서 해당 함수를 정의할거라고 알려주는 용도
	- 선언 방법: =0 사용
	```c++
	class Enemy{
		public:
			virtual void attack() = 0;
	};
	```
- **하위 클래스는 pure virtual function을 반드시 override 해야함**
- override 안하면, 컴파일할 때, 하위클래스를 생성하면서 에러남
- **Abstract Class**
	- pure virtual function을 가진 base class
	- 객체 생성 불가, 포인터로만 사용 가능
	``` C++
	Enemy e; //error
	```	

## Template

