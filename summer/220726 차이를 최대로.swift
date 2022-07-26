import Foundation

let size = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var visited = Array(repeating: false, count: size)
var arr = [Int]()
var max = -Int.max

func getSum() {
    var idx = 0
    var sum = 0
    while idx < size - 1 {
        let add = abs(arr[idx] - arr[idx + 1])
        sum += add
        idx += 1
    }
    
    if sum > max {
        max = sum
    }
}

func recur() {
    if arr.count == size {
        getSum()
        return
    }
    
    for i in 0..<size {
        if visited[i] == false {
            visited[i] = true
            arr.append(numbers[i])
            recur()
            arr.removeLast()
            visited[i] = false
        }
    }
}

recur()
print(max)
