import UIKit

/*
 Fibonacci Numbers
 
 0 1 1 2 3 5 8 ...
     ^ index 1
 input : fibonacci until
 */

func fibonacci(until n: Int) -> String {
    var first = 0
    var second = 1
    var result: String = ""
    result += String(first) + ", " + String(second)
    
    for _ in 1...n {
        let num = first + second
        result += ", \(num)"
        first = second
        second = num
    }
    
    return result
}

print(fibonacci(until: 10))
