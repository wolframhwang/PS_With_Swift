let ESM = readLine()!.split(separator: " ").map { Int($0)! }
let E = ESM[0] - 1, S = ESM[1] - 1, M = ESM[2] - 1
// E <= 15, S <= 28, M <= 19
var s = E, m = E

var answer = E + 1

while !(s == S && m == M) {
    s = (s + 15) % 28
    m = (m + 15) % 19
    answer += 15
}

print(answer)



