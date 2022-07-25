let n = Int(readLine()!)!
let half = n / 2
var map: [[Int]] = []
var team = [Bool](repeating: false, count: n)
var answer = 987654321

for _ in 0..<n {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })    
}

func recur(_ now: Int, _ cnt: Int) {
    if now >= n { return }
    if cnt == half {
        var sum1 = 0, sum2 = 0
        for i in 0..<n {
            for j in 0..<n {
                if team[i] == true, team[i] == team[j] { sum1 += map[i][j] }
                if team[i] == false, team[i] == team[j] { sum2 += map[i][j] }
            }
        }        
        answer = min(answer, abs(sum1 - sum2))
        return
    }
    team[now] = true
    recur(now + 1, cnt + 1)
    team[now] = false
    recur(now + 1, cnt)
}
recur(0, 0)
print(answer)
