let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

let N = Int(readLine()!)!

var map: [[Character]] = []
for _ in 0..<N {
    map.append(readLine()!.map{ $0 })
}

var colorBlindness = map
var nonColorBlindness = map

func recur(_ x: Int, _ y :Int, _ blind: Bool, _ blindMap: inout [[Character]], _ target: Character) {
    blindMap[x][y] = "."

    for i in 0..<4 {
        let nx = x + dx[i], ny = y + dy[i]
        if nx < 0 || nx >= blindMap.count || ny < 0 || ny >= blindMap[0].count {
            continue
        }
        if blindMap[nx][ny] == "." { continue }
        if !blind, target != blindMap[nx][ny] { continue }
        if blind {
            if target == "B", (blindMap[nx][ny] == "R" || blindMap[nx][ny] == "G") { continue }
            if (target == "R" || target == "G"), blindMap[nx][ny] == "B" { continue }
        }
        recur(nx, ny, blind, &blindMap, target)
    }
}
var answer: [Int] = [0,0]
for i in 0..<N {
    for j in 0..<N {
        if colorBlindness[i][j] != "." {
            recur(i, j, true, &colorBlindness, colorBlindness[i][j])
            answer[1] += 1
        }
        if nonColorBlindness[i][j] != "." {
            recur(i, j, false, &nonColorBlindness, nonColorBlindness[i][j])
            answer[0] += 1
        }
    }    
}

print("\(answer[0]) \(answer[1])")
