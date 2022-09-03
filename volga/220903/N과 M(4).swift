let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0], M = NM[1]

func recur(_ cnt: Int, _ start: Int, _ str: String) {
    if cnt == 0 {
        print(str)
        return
    }
    for i in stride(from: start, to: N + 1, by: 1) {
        recur(cnt - 1, i, str + "\(i) ")
    }
}


recur(M, 1, "")
