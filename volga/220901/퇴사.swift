let N = Int(readLine()!)!

var T: [Int] = []
var P: [Int] = []
for _ in 0..<N {
    let TP = readLine()!.split(separator: " ").map { Int($0)! }
    T.append(TP[0])
    P.append(TP[1])
}

var answer = 0
let days = T.count
func recur(_ day: Int, _ cost: Int) {
    if day >= T.count { 
        answer = max(answer, cost)
        return
    }
    if day + T[day] <= days {
        recur(day + T[day], cost + P[day])
    }

    recur(day + 1, cost)
}
recur(0, 0)
print(answer)
