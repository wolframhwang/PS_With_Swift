// BOJ 17471 게리맨더링

import Foundation

let n = Int(readLine()!)!
let districts = readLine()!.split(separator: " ").map { Int($0)! }

var map = Array(repeating: [Int](), count: n + 1)
for i in 1...n {
    var input = readLine()!.split(separator: " ").map { Int($0)! }
    input.removeFirst()
    map[i].append(contentsOf: input)
}

var visited = [Bool](repeating: false, count: n + 1)
var min = 10000

for size in 1..<n {
    recur(size, 0, 1)
}

func recur(_ size: Int, _ count: Int, _ idx: Int) {
    if count == size {
        if !isTwo() { return }
        let curDiff = getDiff()
        if curDiff < min {
            min = curDiff
        }
        return
    }
    
    if idx > n {
        return
    }
    
    visited[idx] = true
    recur(size, count + 1, idx + 1)
    visited[idx] = false
    recur(size, count, idx + 1)
}

func isTwo() -> Bool {
    var checked = [Int](repeating: 0, count: n + 1)
    var disCount = 0
    for i in 1...n {
        if checked[i] != 0 { continue }
        if visited[i] == true {
            var queue = [i]
            
            while !queue.isEmpty {
                let cur = queue[0]
                checked[cur] = 1
                
                for j in 0..<map[cur].count {
                    let now = map[cur][j]
                    if visited[now] != true { continue }
                    if checked[now] == 0 {
                        queue.append(now)
                    }
                }
                queue.removeFirst()
            }
        } else {
            var queue = [i]
            
            while !queue.isEmpty {
                let cur = queue[0]
                checked[cur] = 2
                
                for j in 0..<map[cur].count {
                    let now = map[cur][j]
                    if visited[now] != false { continue }
                    if checked[now] == 0 {
                        queue.append(now)
                    }
                }
                queue.removeFirst()
            }
        }
        disCount += 1
    }

    if disCount > 2 { return false }
    
    return true
}

func getDiff() -> Int {
    var sumA = 0
    var sumB = 0
    for i in 1...n {
        if visited[i] == true {
            sumA += districts[i - 1]
        } else {
            sumB += districts[i - 1]
        }
    }
    
    return abs(sumA - sumB)
}

if min != 10000 {
    print(min)
} else {
    print(-1)
}
