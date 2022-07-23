import Foundation

let N = Int(readLine()!)!
let A = readLine()!.components(separatedBy: " ").map { Int($0)! }
var amxd = readLine()!.components(separatedBy: " ").map { Int($0)! }

var MAX = Int.min, MIN = Int.max


func recur(_ value: Int, _ idx: Int) {
    if idx == N {
        MAX = max(MAX, value)
        MIN = min(MIN, value)
        return
    }
    for i in 0..<4 {
        if amxd[i] > 0 {
            amxd[i] -= 1
            if i == 0 {
                recur(value + A[idx], idx + 1)
            } else if i == 1 {
                recur(value - A[idx], idx + 1)
            } else if i == 2 {
                recur(value * A[idx], idx + 1)
            } else {
                if value < 0 {
                    var diff = -value
                    diff /= A[idx]
                    recur(-diff, idx + 1)
                }
                else {
                    recur(value / A[idx], idx + 1)
                }
            }
            amxd[i] += 1
        }
    }
}

recur(A[0], 1)

print("\(MAX)\n\(MIN)")
