// BOJ 10971 외판원 순회 2
// 항상 순회할 수 있는 경우만 주어진다
// 다시 원래의 도시로 돌아와야 한다
let cities = Int(readLine()!)!
var map = Array(repeating: [Int](), count: cities)

for i in 0..<cities {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    map[i].append(contentsOf: line)
}

var visited = Array(repeating: false, count: cities + 1)
var cost = Int.max

// 갈 수 없는 곳 = 0
// 가장 적은 비용
func recur(_ cur: Int, _ count: Int, _ sum: Int, _ start: Int) {
    if count == cities, map[cur][start] > 0 {
        let endSum = sum + map[cur][start]
        cost = endSum < cost ? endSum : cost
        return
    } else if count == cities {
        return
    }
    
    visited[cur] = true
    for i in 0..<cities {
        if map[cur][i] == 0 || visited[i] { continue }
        visited[i] = true
        recur(i, count + 1, sum + map[cur][i], start)
        visited[i] = false
    }
}

for i in 0..<cities {
    recur(i, 1, 0, i)
}

print(cost)
