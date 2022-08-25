let input = readLine()!.split(separator: " ").map { Int($0)! }
let maxNum = input[0]
let limit = input[1]

var arr = [Int]()
var visited = Array(repeating: false, count: maxNum + 1)

func recur() {
    if arr.count == limit {
        arr.forEach { print($0, terminator: " ")}
        print()
        return
    }

    for i in 1...maxNum {
        if visited[i] { continue }
        arr.append(i)
        visited[i] = true
        recur()
        arr.removeLast()
        visited[i] = false
    }

}

recur()
