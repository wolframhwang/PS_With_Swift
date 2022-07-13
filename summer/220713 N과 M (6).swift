import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]

var numbers = readLine()!.split(separator: " ").map { Int($0)! }
numbers.sort { $0 < $1 }

var results = [[Int]]()

func recur(_ arr: inout [Int], _ idx: Int) {
    if arr.count == m {
        results.append(arr)
        return
    }
    if idx >= n {
        return
    }
    
    arr.append(numbers[idx])
    recur(&arr, idx + 1)
    arr.removeLast()
    recur(&arr, idx + 1)
}

var arr = [Int]()
recur(&arr, 0)

for arr in results {
    arr.forEach { print($0, terminator: " ") }
    print()
}
