let NK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NK[0], K = NK[1]
// 0 <= N, K <= 100,000
let MAX = 100000, INF = 987654321
var visit = [Int](repeating: INF, count: MAX + 1)

var q: [Int] = [N], front = 0
visit[N] = 0

while q.count != front {
    let now = q[front]
    front += 1

    let jump = now * 2, forward = now + 1, backward = now - 1
    if jump <= MAX, visit[jump] > visit[now] {
        visit[jump] = visit[now]
        q.append(jump)
    }
    if forward <= MAX, visit[forward] > visit[now] + 1 {
        visit[forward] = visit[now] + 1
        q.append(forward)
    }
    if backward >= 0, visit[backward] > visit[now] + 1 {
        visit[backward] = visit[now] + 1
        q.append(backward)
    }
}

print(visit[K])
