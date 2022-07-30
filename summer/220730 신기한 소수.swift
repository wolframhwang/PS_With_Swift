// BOJ 2023 신기한 소수

let length = Int(readLine()!)!
var result = [Int]()

func isPrime(_ number: Int) -> Bool {
    if number == 1 { return false }
    if number == 2 { return true }
    
    var i = 2
    
    while i * i <= number {
        if number % i == 0 { return false }
        i += 1
    }
    
    return true
}

var start = [2, 3, 5, 7]
var number = [Int]()

for i in 0..<4 {
    number.append(start[i])
    recur(1)
    number.removeAll()
}

func recur(_ digit: Int) {
    let str = number.map { String($0) }
    let num = Int(str.joined())!
    
    if digit == length {
        if isPrime(num) {
            result.append(num)
        }
        return
    }

    
    if !isPrime(num) {
        return
    }
    
    for i in 0...9 {
        number.append(i)
        recur(digit + 1)
        number.removeLast()
    }
}

result.forEach { print($0) }
