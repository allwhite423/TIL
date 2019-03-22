import UIKit

let arr = [3,4,510, 44, 55, 78, 6888, 100]

// 1. get the sum of all numbers in the array
var sum = 0;
for item in arr {
//    print(item)
    sum += item
}

print("sum of the array: \(sum)")

//2. get the count of elements in the array
for index in 0 ..< arr.count {
    print(arr[index])
}

//3. where statament in for loop
for item in arr where item % 2 == 0 {
    print(item)
}

//3. reversed order
for i in (1...99).reversed() {
    print(i)
}


