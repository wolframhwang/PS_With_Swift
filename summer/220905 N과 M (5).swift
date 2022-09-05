// BOJ 15654 N과 M (5)
let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

let numArr = readLine()!.split(separator: " ").map{ Int($0)! }.sorted()
var arr = [Int]()
var visited = [Bool](repeating: false, count: n)

func recur(_ idx: Int) {
    if arr.count == m {
        arr.forEach { print($0, terminator: " ")}
        print("")
        return
    }
    
    if idx >= n { return }
    
    for i in 0..<n {
        if visited[i] == true { continue }
        visited[i] = true
        arr.append(numArr[i])
        recur(i)
        arr.removeLast()
        visited[i] = false
    }
}

recur(0)
