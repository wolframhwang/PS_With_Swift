var map = Array(repeating: [Character](), count: 8)
for i in 0..<8 {
    map[i].append(contentsOf: Array(readLine()!))
}
var visited = Array(repeating: Array(repeating: false, count: 8), count: 8)
var cur = (x: 7, y: 0)
var queue = [(x: 7, y: 0, level: 0)]
let dx = [0, 0, 0, 1, 1, 1, -1, -1, -1]
let dy = [0, 1, -1, 0, 1, -1, 0, 1, -1]

func moveTo(_ x: Int, _ y: Int, _ level: Int) {
    for i in 0..<9 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if nx < 0 || nx >= 8 || ny < 0 || ny >= 8 { continue }
        if map[nx][ny] == "#" { continue }
        if map[nx][ny] == "." {
            if checkUp(nx, ny) {
                if visited[nx][ny] { continue }
                queue.append((nx, ny, level + 1))
            }
        }
    }
    
    visited[x][y] = true
}

func checkUp(_ x: Int, _ y: Int) -> Bool {
    if x == 0 { return true }
    if map[x - 1][y] == "#" { return false }
    return true
}

func moveWall() -> [[Character]] {
    var newMap = Array(repeating: [Character](), count: 8)
    var newLine = [Character]()
    
    for _ in 0..<8 {
        newLine.append(".")
    }
    
    newMap[0].append(contentsOf: newLine)
    
    for i in 0..<7 {
        newMap[i + 1].append(contentsOf: map[i])
    }
    
    return newMap
}

func sol() -> Int {
    
    // 큐의 첫번째 원소를 꺼내서 탐색탐색탐색 -> 첫 번째 탐색한 큐가 돌 동안은 moveWall하면 안됨!
    // 틀렸을 경우, map을 되돌려야 함 << 이게 문제네
    
    // 1-1, 1-2, 1-3
    // 1-2, 1-3, 2-1, 2-2
    // 1-3, 2-1, 2-2
    // 1-3, 2-1, 2-2, 2-3 - moveWall
    // 2-1, 2-2, 2-3
    //
    while queue.count > 0 {
        moveTo(queue[0].x, queue[0].y, queue[0].level)
        cur.x = queue[0].x
        cur.y = queue[0].y
        if queue.count > 1 && queue[0].level != queue[1].level {
            map = moveWall()
        }
        queue.removeFirst()
        if cur.x == 0 && cur.y == 7 { return 1 }
        if map[cur.x][cur.y] == "#" {
            continue
        }
    }
    
    return 0
}

print(sol())
