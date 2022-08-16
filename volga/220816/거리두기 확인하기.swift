import Foundation
let dx = [0,0,1,-1], dy = [1,-1,0,0]
var map: [[Character]] = [[Character]](repeating: [], count: 5)

func bfs(_ x: Int, _ y: Int) -> Bool {
    var visit = [[Bool]](repeating: [Bool](repeating: false, count: 5), count: 5)
    visit[x][y] = true
    var q: [(x: Int, y: Int)] = [(x, y)]
    var front = 0, rear = 0

    for i in 0..<2 {
        rear = q.count
        for j in front..<rear {
            let now = q[front]
            front += 1
            
            for i in 0..<4 {
                let nx = now.x + dx[i], ny = now.y + dy[i]
                if nx < 0 || nx >= 5 || ny < 0 || ny >= 5 { continue }
                if visit[nx][ny] { continue }
                if map[nx][ny] == "X" { continue }
                if map[nx][ny] == "P" { return false }
                visit[nx][ny] = true
                q.append((nx, ny))
            }
        }
    }
    return true
}


func solve() -> Bool {
    var ret = true
    for i in 0..<map.count {
        for j in 0..<map[i].count {
            if map[i][j] == "P" {
                ret = bfs(i, j)
                if !ret { return ret }
            }
        }
    }
    return ret
}

func solution(_ places:[[String]]) -> [Int] {
    var answer: [Int] = []
    for place in places {
        for i in 0..<place.count {
            map[i] = []
            for c in place[i] {
                map[i].append(c)
            }
        }
        if solve() { answer.append(1) }
        else { answer.append(0) }
    }
    return answer
}
