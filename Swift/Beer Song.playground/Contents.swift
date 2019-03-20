import UIKit

// external_parameter : a parameter used when the function is called. _ :when you don't want to mention external parameter name
// internal_parameter : a parameter(variable name) used inside the function (implementation)
//  순서 :   external_parameter internal_parameter : data_types
// ex. func beersong(_ totalNumberOfBeer: Int) -> String    =>  beersong(99)
// ex. func beersong(totalNumberOfBeer: Int) -> String      =>  beersong(totalNumberOfBeer: 99)

func beersong(forThisManyBottleOfBeer totalNumberOfBeer: Int) -> String { //Swift Style
    var lyrics: String = ""
    
    for num in (1...totalNumberOfBeer).reversed() {
        let newLine = "\n\(num) bottles of beer on the wall..\n"
        lyrics += newLine
    }
    
    lyrics += "\nNo more bottles of beer on the wall.. \n"
    
    return lyrics
}


print(beersong(forThisManyBottleOfBeer: 20))
