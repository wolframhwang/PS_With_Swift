
import Foundation

var map: [[Int]] = []
var visit: [Int] = []
var infos: [Int] = []
var answer = 0
func recur(_ node: Int, _ sheep: Int, _ wolf: Int) {
    var s = sheep, w = wolf
    let memnode = infos[node]
    if infos[node] == 0 {
        s += 1
        answer = max(answer, s)
    } else if infos[node] == 1 {
        w += 1
    }
    infos[node] = -1

    for next in map[node] {
        if visit[next] >= s {
            continue
        }
        if infos[next] == 1, s == w + 1 {
            continue
        }
        let mem = visit[next]
        visit[next] = s
        recur(next, s, w)
        visit[next] = mem
    }

    infos[node] = memnode
}

func solution(_ info:[Int], _ edges:[[Int]]) -> Int {
    map = [[Int]](repeating: [], count: info.count)
    visit = [Int](repeating: 0, count: info.count)
    infos = info
    for edge in edges {
        map[edge[0]].append(edge[1])
        map[edge[1]].append(edge[0])
    }

    recur(0, 0, 0)

    return answer
}
