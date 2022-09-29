class Solution {
    let dx = [0,0,1,-1], dy = [1,-1,0,0]
    var n = 0, m = 0
    var visit = [[Int]]()
    var map = [[Int]]()

    func bfs(_ x: Int, _ y: Int, _ cnt: Int) -> Bool {
        var at = (x == 0 || y == 0), pa = (x == n - 1) || (y == m - 1)

        visit[x][y] = cnt
        var q: [(x: Int, y: Int)] = [(x, y)]
        var front = 0

        while front != q.count {
            if at, pa { return true }
            let now = q[front]
            front += 1

            for i in 0..<4 {
                let nx = now.x + dx[i]
                let ny = now.y + dy[i]
                if nx < 0 || nx >= n || ny < 0 || ny >= m { continue }
                if visit[nx][ny] == cnt { continue }
                if map[nx][ny] > map[now.x][now.y] { continue }
                visit[nx][ny] = cnt
                q.append((nx, ny))
                let l = (nx == 0 || ny == 0)
                let r = (nx == n - 1) || (ny == m - 1)
                at = l ? true: at
                pa = r ? true: pa
            }
        }
        if at, pa { return true }
        return false
    }

    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        var answer = [[Int]]()
        self.n = heights.count
        self.m = heights[0].count
        self.visit = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
        self.map = heights
        var height = 1
        for i in 0..<n {
            for j in 0..<m {
                if bfs(i, j, height) {
                    answer.append([i, j])
                }
                height += 1
            }
        }
        return answer
    }
}
