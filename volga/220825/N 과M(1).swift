let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0], M = NM[1]
var visit: [Bool] = [Bool](repeating: false, count: N + 1)
var cnt = [Int](repeating: 0, count: M + 1)
func recur(_ now: Int, _ idx: Int) {
    if idx == M {
        for i in 0..<M {
            print(cnt[i], terminator: " ")
        }
        print()
        return
    }
    for i in 1...N {
        if visit[i] { continue }
        visit[i] = true
        cnt[idx] = i
        recur(i, idx + 1)
        cnt[idx] = 0
        visit[i] = false
    }
    
}

recur(0, 0)
