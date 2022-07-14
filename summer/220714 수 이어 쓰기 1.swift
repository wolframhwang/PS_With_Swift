import Foundation

let number = Int(readLine()!)!
var result = 0

// 일의 자리 : 1 ~ 9 : 9개
// 십의 자리 : 10 ~ 90 : 90개
// 백의 자리 : 100 ~ 999 : 900개
// 1, 10, 100, ... 인 경우를 고려해서 부등호 설정해야 

var div = 10
var digit = 1
var count = 1
func recur(_ number: Int) {
    while number >= digit {
        var add = 0
        if div <= number {
            add = div - digit
        } else {
            add = number % div - digit + 1
        }
        print(add)
        result += add * count
        div *= 10
        digit *= 10
        count += 1
    }
}

recur(number)
print(result)
