var user: Int = 0
var map: [[Int]] = []
var answer: Int = 0
var minDistSum: Int = Int.max

/* 0   1   2   3  4   5
 [100, 0, 100, 1, 1, 100]
 [100, 100, 0, 1, 100, 100]
 */

func solve(_ start: Int) -> Int {
    var queue: [(person: Int, dist: Int)] = [(start, 0)]
    var visited: [Bool] = Array(repeating: false, count: user + 1)
    visited[start] = true
    var front: Int = 0
    
    while front != queue.count {
        let now = queue[front]
        for i in 1...user {
            if visited[i] { continue }
            if map[now.person][i] == 1 {
                queue.append((i, now.dist + 1))
                visited[i] = true
            }
        }
        front += 1
    }
    
    var result: Int = 0
    for (_, d) in queue {
        result += d
    }

    return result
}

func main() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    user = input[0]
    let vertice: Int = input[1]
    
    map = Array(repeating: Array(repeating: 200, count: user + 1), count: user + 1)
    
    for i in 1...user {
        for j in 1...user {
            if i == j { map[i][j] = 0 }
        }
    }
    
    for _ in 0..<vertice {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        let from = line[0]
        let to = line[1]
        map[from][to] = 1
        map[to][from] = 1
    }
    
    for i in 1...user {
        let output = solve(i)
        if minDistSum > output {
            minDistSum = output
            answer = i
        }
    }
    
    print(answer)
}

main()
