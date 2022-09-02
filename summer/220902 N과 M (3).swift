// BOJ 15651 N과 M (3) >>> 시간초과 핵짜증!!
let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

var arr = [Int]()

func recur(_ count: Int) {
    if count == m {
        arr.forEach { print($0, terminator: " ")}
        print("")
        return
    }
    
    for i in 1...n {
        arr.append(i)
        recur(count + 1)
        arr.removeLast()
    }
}

recur(0)
