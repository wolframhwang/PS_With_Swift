import Foundation

typealias Point = (r: Int, c: Int, move: Int)
var map = [[Int]]()
let INF = 987654321

func bfs(_ point: Point, _ card: Point) -> Int {
    var visit = [[Bool]](repeating: [Bool](repeating: false, count: 4), count: 4)
    visit[point.r][point.c] = true
    var q = [Point]()
    q.append(point)
    var front = 0
    let delta = [[-1, 0], [1, 0], [0, -1], [0, 1]]

    while q.count != front {
        let (r, c, move) = q[front]
        front += 1
        if card.r == r, card.c == c {
            return move
        }

        for d in delta {
            var nr = r + d[0], nc = c + d[1]
            if nr < 0 || nr > 3 || nc < 0 || nc > 3 {
                continue
            }

            if !visit[nr][nc] {
                q.append(Point(nr, nc, move+1))
                visit[nr][nc] = true
            }

            for _ in 0..<2 {
                guard map[nr][nc] == 0, nr + d[0] >= 0, nr + d[0] < 4, nc + d[1] >= 0, nc + d[1] < 4 else { break }
                nr += d[0]
                nc += d[1]
            }

            if !visit[nr][nc] {
                q.append(Point(nr, nc, move+1))
                visit[nr][nc] = true
            }
        }
    }
    return -1
}

func recur(_ point: Point) -> Int {
    var result = INF
    for card in 1...6 {
        var cards = [Point]()
        for r in 0..<4 {
            for c in 0..<4 {
                guard map[r][c] == card else { continue }
                cards.append(Point(r, c, 0))
            }
        }

        guard !cards.isEmpty else { continue }

        let try1 = bfs(point, cards[0]) + bfs(cards[0], cards[1]) + 2
        let try2 = bfs(point, cards[1]) + bfs(cards[1], cards[0]) + 2

        cards.forEach {
            map[$0.r][$0.c] = 0
        }

        result = min(result, try1 + recur(cards[1]))
        result = min(result, try2 + recur(cards[0]))

        cards.forEach {
            map[$0.r][$0.c] = card
        }
    }
    if result == INF {
        return 0   
    }
    return result
}

func solution(_ board:[[Int]], _ r:Int, _ c:Int) -> Int {

    map = board
    return recur(Point(r, c, 0))
}
