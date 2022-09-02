let input = readLine()!.split(separator: " ").map { Int($0)! }
let maxNum = input[0] //1...N까지 자연수 중
let limit = input[1] //M개를 중복없이 고른 수열

var arr = [Int]()
var visited = Array(repeating: false, count: maxNum + 1)

func recur(n:Int) {
    if arr.count == limit {
        arr.forEach { print($0, terminator: " ")}
        print()
        return
    }
    
    if n > maxNum {
        return
    }
    
    for i in n...maxNum {
        if visited[i] { continue }
        arr.append(i)
        visited[i] = true
        recur(n: i+1)
        arr.removeLast()
        visited[i] = false
    }
}



recur(n:1)
