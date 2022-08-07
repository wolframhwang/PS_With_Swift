class Solution {
    var N = 0, M = 0
    var map: [[Character]] = []
    let dx8 = [0,0,1,-1,1,1,-1,-1], dy8 = [1,-1,0,0,1,-1,1,-1]
    let dx = [0,0,1,-1], dy = [1,-1,0,0]
    let IntToCharacter: [Character] = ["0", "1" , "2", "3" ,"4","5","6","7","8","9"]
    func bfs(_ x: Int, _ y: Int) {
        var q: [(x: Int, y: Int)] = [(x, y)]
        var front = 0
        
        while q.count != front {
            let now = q[front]
            front += 1
            if map[now.x][now.y] == "M" {
                map[now.x][now.y] = "X"
                return
            } else if map[now.x][now.y] == "E" {
                var mineCnt = 0
                for i in 0..<8 {
                    let nx = now.x + dx8[i], ny = now.y + dy8[i]
                    if nx < 0 || nx >= N || ny < 0 || ny >= M { continue }
                    if map[nx][ny] == "M" { mineCnt += 1 }
                }
                
                if mineCnt > 0 {
                    map[now.x][now.y] = IntToCharacter[mineCnt]
                } else {
                    map[now.x][now.y] = "B"
                    for i in 0..<8 {
                        let nx = now.x + dx8[i], ny = now.y + dy8[i]
                        if nx < 0 || nx >= N || ny < 0 || ny >= M { continue }
                        if map[nx][ny] != "E" { continue }
                        q.append((nx, ny))
                    }
                }
            }
        }
    }
    
    func updateBoard(_ board: [[Character]], _ click: [Int]) -> [[Character]] {
        N = board.count; M = board[0].count
        
        self.map = board
        bfs(click[0], click[1])
        
        return map
    }
}
