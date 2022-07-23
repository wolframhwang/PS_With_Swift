
let dx = [0,0,1,-1,1,1,-1,-1]
let dy = [1,-1,0,0,1,-1,1,-1]

while true {
    let wh = readLine()!.split(separator: " ").map { Int($0)! }
    let w = wh[0], h = wh[1]
    if w == 0, h == 0 { break }
    
    var map: [[Int]] = []
    var answer = 0
    for _ in 0..<h {
        map.append(readLine()!.split(separator: " ").map { Int($0)! })
    }
    
    func recur(_ x: Int, _ y: Int) {
        map[x][y] = 0
        for i in 0..<8 {
            let nx = x + dx[i], ny = y + dy[i]
            if nx < 0 || nx >= map.count || ny < 0 || ny >= map[0].count { continue }
            if map[nx][ny] == 0 { continue }
            recur(nx, ny)
        }
    }
    
    for i in 0..<h {
        for j in 0..<w {
            if map[i][j] == 1 {
                recur(i, j)
                answer += 1
            }
        }
    }
    

    print(answer)
}

