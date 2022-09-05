let NM = readLine()!.split(separator: " ").compactMap { Int($0) }
let N = NM[0], M = NM[1]
let arr = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted { $0 < $1 }

var visit: [Bool] = [Bool](repeating: false, count: N + 10)
func recur(_ idx: Int, _ str: String) {
    if idx == M {
        print(str)
        return
    }
    for i in 0..<arr.count {
        if visit[i] { continue }
        
        visit[i] = true
        recur(idx + 1, str + "\(arr[i]) ")
        visit[i] = false
    }
}

recur(0, "")
