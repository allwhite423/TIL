import UIKit

func calculateBMI(weight: Double, height: Double) -> String {
    let bmi: Double = weight / pow(height, 2)
    
    if bmi > 25.0 {
        print( "you are overweight.")
    } else if bmi >= 18.5  {
        print( "you are of normal weight.")
    } else {
        print( "you are underweight.")
    }
    
    let shortenedBMI: String = String(format: "%.4f", bmi)
    return shortenedBMI
    
}

print(calculateBMI(weight: 52, height: 1.6))
