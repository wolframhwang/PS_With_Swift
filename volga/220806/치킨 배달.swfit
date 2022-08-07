let NM = readLine()!.split(separator: " ").map{ Int($0)! }
let N = NM[0], M = NM[1]
let dx = [0,0,1,-1], dy = [1,-1,0,0]
let INF = 987654321
var map: [[Int]] = []
var chickenStore: [(x: Int, y: Int)] = [(0, 0)]
var house: [(x: Int, y: Int)] = [(0, 0)]
var dist: [[Int]] = []

var distStore: [Int] = []
for i in 0..<N {
    let map = readLine()!.split(separator: " ").map { Int($0)! }
    for j in 0..<map.count {
        if map[j] == 2 {
            chickenStore.append((i, j))
        } else if map[j] == 1 {
            house.append((i, j))
        }
    }
}

dist = [[Int]](repeating: [Int](repeating: 0, count: chickenStore.count), count: house.count)
for i in 1..<house.count {
    for j in 1..<chickenStore.count {
        dist[i][j] = abs(house[i].x - chickenStore[j].x) + abs(house[i].y - chickenStore[j].y)
    }
}

var chk : [Int] = [Int](repeating: 0, count: chickenStore.count)
var answer = 130000
func recur(_ node: Int) {
    if node == M {
        var sum = 0
        for i in 1..<house.count {
            var m = 100
            for j in 1...M {
                m = m > dist[i][chk[j]] ? dist[i][chk[j]]: m
            }
            sum += m
        }
        answer = min(answer, sum)
        return
    }
    for i in chk[node]+1..<chickenStore.count {
        chk[node + 1] = i
        recur(node + 1)
    }
}

recur(0)

print(answer)
