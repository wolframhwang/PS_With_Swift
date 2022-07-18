var numberOfCoumputer = Int(readLine()!)!
var numberOfPairingComputer = Int(readLine()!)!

var map: [Int: [Int]] = [:]
var visit = [Bool](repeating: false, count: numberOfCoumputer + 1)
var answer = 0

for _ in 0..<numberOfPairingComputer {
    let pair = readLine()!.split(separator: " ").map{ Int($0)! }
    map[pair[0], default: []].append(pair[1])
    map[pair[1], default: []].append(pair[0])
}


func recur(_ now: Int) {
    for next in map[now, default: []] {
        if visit[next] { continue }
        visit[next] = true
        recur(next)
        answer += 1
    }
}

visit[1] = true
recur(1)

print(answer)
