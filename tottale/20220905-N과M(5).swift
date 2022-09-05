let NM = readLine()!.split(separator: " ").compactMap{Int($0)}
let N = NM[0]
let M = NM[1]
let arr = readLine()!.split(separator: " ").compactMap{Int($0)}.sorted()
var str = ""
var visited = Array(repeating: false, count: N)

func recur(depth: Int, _ str: String) {
    if depth == M {
        print(str)
        return
    }
    for i in 0..<N {
        if visited[i] { continue }
        visited[i] = true
        recur(depth: depth + 1, str + "\(arr[i]) ")
        visited[i] = false
    }
}
recur(depth: 0, "")
