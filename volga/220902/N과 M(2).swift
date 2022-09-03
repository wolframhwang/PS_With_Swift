let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0], M = NM[1]

var visit = [Bool](repeating: false, count: N + 1)

func recur(_ index: Int, _ start: Int, _ str: String) {
    if index == M {
        print(str)
        return
    }
    for i in stride(from: start, to: N + 1, by: 1) {
        if visit[i] { continue }
        visit[i] = true
        recur(index + 1, i + 1, str + "\(i) ")
        visit[i] = false
    }
}


recur(0, 1, "")
