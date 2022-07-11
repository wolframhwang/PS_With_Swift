// BOJ 9095 1, 2, 3 더하기
// 정수 n을 1, 2, 3의 합으로 나타내는 방법 (0 < n < 11)
// 1, 2, 3 중 몇 개만 사용해도 되고, 중복으로 사용해도 된다
// 순서가 다르면 다른 경우의 수 (1 + 2와 2 + 1은 다르게 카운트)

import Foundation

var targets = [Int]()

for _ in 0..<Int(readLine()!)! {
    targets.append(Int(readLine()!)!)
}


func recur(_ target: Int, _ sum: Int, _ count: inout Int) {
    if sum == target {
        count += 1
        return
    }
    
    if sum >= target {
        return
    }
    
    recur(target, sum + 1, &count)
    recur(target, sum + 2, &count)
    recur(target, sum + 3, &count)
}

var count = 0
targets.forEach {
    recur($0, 0, &count)
    print(count)
    count = 0
}
