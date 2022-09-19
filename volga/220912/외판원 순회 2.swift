let N = Int(readLine()!)!
var W: [[Int]] = []
for _ in 0..<N {
    W.append(readLine()!.split(separator: " ").map { Int($0)! })
}
var answer = 987654321
var visit = [Bool](repeating: false, count: N + 1)
var start = 0
func dfs(_ now: Int, _ cost: Int, _ cnt: Int) {
    if cnt == N - 1 {
        if W[now][start] == 0 { return }
        answer = min(answer, cost + W[now][start])
        return
    }
    if cost >= answer { return }
    for i in 0..<N {
        if now == i { continue }
        if visit[i] { continue }
        if W[now][i] == 0 { continue }
        visit[i] = true
        dfs(i, cost + W[now][i], cnt + 1)
        visit[i] = false
    }
}

for i in 0..<N {
    start = i
    visit[i] = true
    dfs(i, 0, 0)
    visit[i] = false
}

print(answer)
