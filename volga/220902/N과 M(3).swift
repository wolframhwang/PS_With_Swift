let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0], M = NM[1]

var d: [Int] = [Int](repeating: 0, count: 10)

func recur(_ cnt: Int, _ ptr: Int, _ str: String) {
    if cnt == 0 {
        print(str)
        return
    }
    for i in 1...N {
        recur(cnt - 1, ptr + 1, str + "\(i) ")
    }
}

recur(M, 0, "")
