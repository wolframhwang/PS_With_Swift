let N = Int(readLine()!)!

let A = readLine()!.split(separator: " ").map { Int($0)! }
var dist = [Int](repeating: 0, count: N)
var visit = [Bool](repeating: false, count: N)

var answer = -987654321

func calculate() -> Int {
    var ret = 0
    for i in 1..<N {
        ret += abs(dist[i] - dist[i - 1])
    }
    
    return ret
}

func recur(_ idx: Int) {
    if idx == N {
        let result = calculate()
        answer = max(answer, result)
        return
    }
    for i in 0..<N {
        if visit[i] { continue }
        visit[i] = true
        dist[idx] = A[i]
        recur(idx + 1)
        dist[idx] = 0
        visit[i] = false
    }
}

recur(0)

print("\(answer)")
