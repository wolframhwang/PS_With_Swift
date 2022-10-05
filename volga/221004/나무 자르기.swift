let NM = readLine()!.split(separator: " ").map { Int($0)! }
let trees = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0], M = NM[1]
var s = 0, e = 2000000000, answer = 0

while s <= e {
    let m = (s + e) / 2
    let sum = getSum(m)
    if sum >= M {
        s = m + 1
        answer = max(m, answer)
    } else {
        e = m - 1
    }
}

func getSum(_ height: Int) -> Int {
    var ret = 0
    for tree in trees {
        let diff = tree - height
        ret += diff < 0 ? 0: diff
    }
    return ret
}

print(e)
