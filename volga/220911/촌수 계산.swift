let N = Int(readLine()!)!

let ab = readLine()!.split(separator: " ").map { Int($0)! }
let a = ab[0], b = ab[1]
let M = Int(readLine()!)!

var map = [[Int]](repeating: [], count: N + 1)
for i in 0..<M {
    let relationship = readLine()!.split(separator: " ").map { Int($0)! }
    map[relationship[0]].append(relationship[1])
    map[relationship[1]].append(relationship[0])
}

var visit = [Int](repeating: -1, count: N + 1)
var answer = -1

func recur(_ now: Int) {
    if now == b {
        answer = visit[b]
        return
    }
    for next in map[now] {
        if visit[next] >= 0 { continue }
        visit[next] = visit[now] + 1
        recur(next)
    }
}

visit[a] = 0
recur(a)
print(answer)
