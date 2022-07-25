import Foundation

let NM = readLine()!.components(separatedBy: " ").map{ Int($0)! }
let N = NM[0], M = NM[1]

let arr = readLine()!.components(separatedBy: " ").map{ Int($0)! }.sorted{ $0 < $1 }

func recur(_ x: Int, _ str: String) {
    if x == M {
        print(str)
        return
    }
    var multi = -1
    for i in 0..<N {
        if multi == arr[i] { continue }
        multi = arr[i]
        recur(x + 1, str + "\(arr[i]) ")
    }
}

recur(0, "")

