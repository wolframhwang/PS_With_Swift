let Dday = Int(readLine()!)!
var T: [Int] = []
var P: [Int] = []
for _ in 0..<Dday {
    let input = readLine()!.split(separator: " ").compactMap{Int($0)}
    T.append(input[0])
    P.append(input[1])
}
var maxProfit = 0
func recur(_ day: Int, _ profit: Int) {
    if day >= Dday {
        maxProfit = max(profit, maxProfit)
        return
    }
    if day + T[day] <= Dday {
        recur(day + T[day], profit + P[day])
    }
    recur(day+1, profit)
}

recur(0, 0)
print(maxProfit)
