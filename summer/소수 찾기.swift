import Foundation

let input = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }

func isPrime(_ number: Int) -> Bool {
    if number == 0 || number == 1 { return false }
    
    var div = 2
    while div * div <= number {
        if number % div == 0 { return false }
        div += 1
    }
    
    return true
}

var result = 0
for number in numbers {
    if isPrime(number) {
        result += 1
    }
}

print(result)
