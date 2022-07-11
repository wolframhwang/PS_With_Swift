// BOJ 2309 일곱 난쟁이
// 일곱 난쟁이의 키의 합이 100
// 오름차순으로 출력

import Foundation

var dwarfs: Array<Int> = []

for _ in 0..<9 {
    dwarfs.append(Int(readLine()!)!)
}

var results = [[Int]]()

func recur(_ idx: Int, _ arr: inout [Int], _ sum: Int) {
    if arr.count == 7 && sum == 100 {
        results.append(arr)
        return
    }
    if sum > 100 { return }
    if arr.count > 7 { return }
    if idx >= dwarfs.count { return }
    
    arr.append(dwarfs[idx])
    recur(idx + 1, &arr, sum + dwarfs[idx])
    arr.removeLast()
    recur(idx + 1, &arr, sum)
}

var result = [Int]()
recur(0, &result, 0)
results[0].sorted().forEach { print($0) }
