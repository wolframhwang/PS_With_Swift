let input = Int(readLine()!)!

// 1~9: 1씩 증가 -> 9개
// 10 ~ 99: 2씩 증가 -> 90개
// 100 ~ 999: 3씩 증가 -> 900개
var answer = 0

func recur(_ digit: Int, _ count: Int) {
    if digit < 1 { return }
    if input >= digit, input < digit * 10  {
        answer += (input - digit + 1) * count
    } else if input > digit {
        answer += digit * 9 * count
    }
    
    recur(digit / 10, count - 1)
}

// 10 11 12 13 14 15 -> 12
// 1 ~ 9 -> 9
recur(100000000, 9)

print(answer)
