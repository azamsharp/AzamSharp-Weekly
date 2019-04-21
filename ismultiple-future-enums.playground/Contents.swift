import UIKit


// FizzBuzz
// 3 - Fizz
// 5 - Buzz
// 3 and 5 - FizzBuzz
/*
let number = 17

if number.isMultiple(of: 3) && number.isMultiple(of: 5) {
    print("FizzBuzz")
} else if number.isMultiple(of: 3) {
    print("Fizz")
} else if number.isMultiple(of: 5) {
    print("Buzz")
} else {
    print("Not FizzBuzz")
}*/


// Future Enums

enum Genre {
    
    case action
    case romantic
    case horror
    case kids
    case fiction
    
}

let genre = Genre.kids

switch genre {
    
    case .action:
        print("action")
    case .romantic:
        print("romantic")
    case .horror:
        print("horror")
    @unknown default:
        print("All other cases")
}





 
