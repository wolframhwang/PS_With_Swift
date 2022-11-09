import Foundation
var sets: [[Int]] = []
var answer = 0
func recur(_ arr: inout [Int], _ idx: Int) {
    if arr.count == 2 {
        answer = max(answer, arr[0] * arr[1])
        return
    }
    if idx == sets.count {
        return
    }
    arr.append(sets[idx].count)
    recur(&arr, idx + 1)
    arr.removeLast()
    recur(&arr, idx + 1)
}

func solution(_ cards:[Int]) -> Int {
    var cards = [0] + cards
    var visit = [Bool](repeating: false, count: cards.count + 1)

    for i in 1..<cards.count {
        if visit[cards[i]] { continue }
        var st: [Int] = []
        var now = i
        var next = cards[now]
        while !visit[next] {
            visit[next] = true
            st.append(now)
            now = next
            next = cards[next]

        }
        if !st.isEmpty {
            sets.append(st)
        }
    }
    var arr: [Int] = []
    recur(&arr, 0)

    return answer
}
