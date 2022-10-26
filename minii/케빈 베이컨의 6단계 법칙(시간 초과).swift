
import Foundation

// 6단계 이내의 서로 아는 사람으로 연결 가능
// 임의의 두 사람이 최소 몇 단계 내에 이어질 수 있는가?

// 1 - 3, 4
// 2 - 3
// 3 - 4
// 4 - 5

// 실제
// 1 - 3, 4
// 2 - 3
// 3 - 1, 2, 4
// 4 - 1, 3, 5
// 5 - 4

// 순서가 없는 그래프 => 연결 리스트 양쪽 연결
// MARK: - 메모리 초과
let NM = readLine()!.split(separator: " ").map { Int($0)! }
let n = NM[0], m = NM[1]
var map: [[Int]] = [[Int]].init(repeating: [Int](), count: n)

for _ in 0..<n {
    let val = readLine()!.split(separator: " ").map { Int($0)! }
    let row = val[0] - 1, col = val[1] - 1
    map[row].append(col)
    map[col].append(row)
}
func bfs(x: Int, y: Int, count: Int) -> Int {
    var q: [(relations: [Int], count: Int)] = [(map[x], count)]
    var front: Int = 0

    while front != q.count {
        let cur: [Int] = q[front].relations
        let count = q[front].count

        for c in cur {
            if c == y { return count + 1 }

            let value = map[c]
            q.append((value, count + 1))
        }

        front += 1

    }

    return count
}

var result: Int = 5000
var index: Int = n + 2

for i in 0..<n {
    var all = 0
    for j in 0..<n {
        if i != j {
            all += bfs(x: i, y: j, count: 0)
        }
    }

    if all < result {
        result = all
        index = i + 1
    } else if all == result {
        index = min(index, i + 1)
    }
}

print(index)

// MARK: - 플로이드 워셜
let NM = readLine()!.split(separator: " ").map { Int($0)! }
let inf = 987654321
let n = NM[0], m = NM[1]
var map: [[Int]] = [[Int]].init(repeating: [Int](repeating: inf, count: n), count: n)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let row = input[0] - 1, col = input[1] - 1
    
    map[row][col] = 1
    map[col][row] = 1
}

for row in 0..<map.count {
    map[row][row] = 0
}


for a in 0..<n {
    for b in 0..<n {
        for k in 0..<n {
            if a == b { continue }
            map[a][b] = min(map[a][b], map[a][k] + map[k][b])
        }
    }
}

let result = map.map { $0.reduce(0, +) }
let minvalue = result.min()!
//print(result)
for i in 0..<result.count {
    if result[i] == minvalue {
        print(i + 1)
        break
    }
}
