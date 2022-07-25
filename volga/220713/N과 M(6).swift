let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0], M = NM[1]
var arr = readLine()!.split(separator: " ").map { Int($0)! }
arr = arr.sorted { $0 < $1 }
var visit = [Bool](repeating: false, count: arr.count)
var dummyAns: [Int] = []

func recur(_ now: Int, _ cnt: Int) {
    if cnt >= M {
        for n in dummyAns {
            print(n, terminator: " ")
        }
        print()
        return
    }
    for i in now..<N {
        if visit[i] { continue }
        visit[i] = true
        dummyAns.append(arr[i])
        recur(i, cnt + 1)
        dummyAns.popLast()
        visit[i] = false
    }
}
recur(0, 0)
