let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0], M = NM[1]
let INF = 987654321
var visit: [[Int]] = [[Int]](repeating: [Int](repeating: INF, count: N + 1), count: N + 1)

var linked: [[Int]] = [[Int]](repeating: [], count: N + 1)
for _ in 0..<M {
    let link = readLine()!.split(separator: " ").map { Int($0)! }
    linked[link[0]].append(link[1])
    linked[link[1]].append(link[0])
}

var answerValue = 987654321
var answer = 0

for i in 1...N {
    let result = bacon(i)
    if answerValue > result {
        answerValue = result
        answer = i
    }
}

func bacon(_ node: Int) -> Int {
    var total = (N - 1) * INF
    let idx = node
    var q: [Int] = [node]
    var front = 0
    visit[idx][node] = 0

    while q.count != front {
        let now = q[front]
        front += 1

        for next in linked[now] {
            if visit[idx][next] <= visit[idx][now] + 1 {
                continue
            }
            total -= visit[idx][next]
            q.append(next)
            visit[idx][next] = visit[idx][now] + 1
            total += visit[idx][next]
        }
    }
    
    return total
}


print(answer)
