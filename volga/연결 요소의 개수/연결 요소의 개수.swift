let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0], M = NM[1]

var map = [[Int]](repeating: [], count: N + 10)
var visit = [Bool](repeating: false, count: N + 10)
var answer = 0

for _ in 0..<M {
    let uv = readLine()!.split(separator: " ").map { Int($0)! }
    map[uv[0]].append(uv[1])
    map[uv[1]].append(uv[0])
}

for node in 1...N {
    if visit[node] { continue }
    linkNode(node)
    answer += 1
}

func linkNode(_ node: Int) {
    visit[node] = true
    
    for nextNode in map[node] {
        if visit[nextNode] { continue }
        linkNode(nextNode)
    }
}


print(answer)
