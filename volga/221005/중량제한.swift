let NM = readLine()!.split(separator: " ").map{ Int($0)! }
let N = NM[0], M = NM[1]

var map = [[(to: Int, weight: Int)]](repeating: [], count: N + 1)
var visit = [Int](repeating: -1, count: N + 1)

for _ in 0..<M {
    let ABC = readLine()!.split(separator: " ").map{ Int($0)! }
    map[ABC[0]].append((ABC[1], ABC[2]))
    map[ABC[1]].append((ABC[0], ABC[2]))
}

let SE = readLine()!.split(separator: " ").map{ Int($0)! }

var s = 0, e = 1000000000 << 1

while s <= e {
    let m = (s + e) / 2
    if bfs(m) {
        s = m + 1
    } else {
        e = m - 1
    }
}

func bfs(_ weight: Int) -> Bool {
    var q: [Int] = [SE[0]]
    visit[SE[0]] = weight
    var front = 0

    while front != q.count {
        let now = q[front]
        front += 1
        if now == SE[1] { return true }

        for nextInfo in map[now] {
            let next = nextInfo.to
            let dist = nextInfo.weight
            if visit[next] == weight { continue }
            if dist < weight { continue }
            q.append(next)
            visit[next] = weight
        }
    }
    return false
}

print(e)
