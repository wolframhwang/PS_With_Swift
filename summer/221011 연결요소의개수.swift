let input = readLine()!.split(separator: " ").map { Int($0)! }
let vertice = input[0]
let edge = input[1]
var answer = 0

var visited = Array(repeating: false, count: vertice + 1)
var map = Array(repeating: [Int](), count: vertice + 1)

for _ in 0..<edge {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    map[line[0]].append(line[1])
    map[line[1]].append(line[0])
}

// 연결 요소의 개수 구하기 (그래프의 개수)
for i in 1...vertice {
    if visited[i] { continue }
    bfs(i)
    answer += 1
}

func bfs(_ cur: Int) {
    visited[cur] = true
    var front = 0
    var queue = [Int]()
    queue.append(cur)
    
    while front != queue.count {
        let now = queue[front]
        front += 1
        
        for i in 0..<map[now].count {
            if visited[map[now][i]] { continue }
            visited[map[now][i]] = true
            queue.append(map[now][i])
        }
    }
}

print(answer)
