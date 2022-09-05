// BOJ 15655 N과 M (6)
let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

let numArr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var arr = [Int]()

func recur(_ idx: Int) {
    if arr.count == m {
        arr.forEach { print($0, terminator: " ")}
        print("")
        return
    }
    
    if idx >= n { return }
    
    for i in idx..<n {
        arr.append(numArr[i])
        recur(i + 1)
        arr.removeLast()
    }
}

recur(0)
