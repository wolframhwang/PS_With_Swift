// 시간 초과 났는데 왜 났는지 모르겠어요..ㅠㅠ

// BOJ 1476 날짜 계산
// 1 <= E <= 15
// 1 <= S <= 28
// 1 <= M <= 19

// E, S가 처음으로 주어진 값과 일치하는 해를 찾고,
// 거기에 M이 일치할 때까지 E, S의 최소공배수만큼씩 해에 더해주면 된다?

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let e = input[0]
let s = input[1]
let m = input[2]

func getGCD(_ a: Int, _ b: Int) -> Int {
    let remain = a % b
    if remain == 0 {
        return b
    } else {
        return getGCD(b, remain)
    }
}
let GCD = getGCD(15, 28)

func getLCM(_ a: Int, _ b: Int) -> Int {
    let LCM = a * b / GCD
    return LCM
}
let LCM = getLCM(15, 28)

var a = 1, b = 1, c = 1

func sol(_ e: Int, _ s: Int, _ m: Int, _ a: Int, _ b: Int, _ c: Int) -> Int {
    var count = e
    
    var div = b % 28
    while true {
        print("div: \(div)")
        if div == s {
            break
        }
        div = (15 + div) % 28
        count += 15
    }
    
    var newc = c + count - 1
    print(newc)
    var di = newc % LCM
    while true {
        print("di: \(di)")
        if di == m {
            break
        }
        di = (LCM + di) % 19
        count += LCM
    }
    
    print(count)
    return count
}

sol(e, s, m, 1, 1, 1)
