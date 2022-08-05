let N = Int(readLine()!)!
let population = readLine()!.split(separator: " ").map{ Int($0)! }
var map: [[Int]] = [[Int]](repeating: [], count: N)

for i in 0..<N {
    let line = readLine()!.split(separator: " ").map{ Int($0)! }
    if line.count <= 1 { continue }
    for j in 1..<line.count {
        map[i].append(line[j] - 1)
    }
}

var team1: [Int] = []
var sum1 = 0
var team2: [Int] = []
var sum2 = 0
var answer = 987654321
var visit: [Bool] = [Bool](repeating: false, count: N)

func isResonable(_ idx: Int, _ team: inout [Int]) {
    visit[idx] = true
    for next in map[idx] {
        for member in team {
            if visit[member] { continue }
            if (member == next) {
                isResonable(next, &team)
            }
        }
    }
}

func divideTeam(_ idx: Int) {
    if idx == N {
        if team1.count == 0 || team2.count == 0 { return }
        for i in 0..<visit.count { visit[i] = false }
        isResonable(team1[0], &team1)
        for i in 0..<team1.count { if visit[team1[i]] == false { return }}
        for i in 0..<visit.count { visit[i] = false }
        isResonable(team2[0], &team2)
        for i in 0..<team2.count { if visit[team2[i]] == false { return }}
        answer = min(answer, abs(sum1 - sum2))
        return
    }
    team1.append(idx)
    sum1 += population[idx]
    divideTeam(idx + 1)
    sum1 -= population[idx]
    team1.removeLast()

    team2.append(idx)
    sum2 += population[idx]
    divideTeam(idx + 1)
    sum2 -= population[idx]
    team2.removeLast()
}

divideTeam(0)
answer = answer == 987654321 ? -1: answer
print(answer)
