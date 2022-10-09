let points = readLine()!.split(separator: " ").map { Int(String($0))! }
var visited = Array(repeating: false, count: 100001)

let x = points[0]
let y = points[1]

var queue: [(Int, Int)] = []

func bfs() {
    queue.append((x, 0))
    
    while !queue.isEmpty {
        let v = queue.removeFirst()

        if v.0 == y {
            print(v.1)
            break
        }

        if  v.0 * 2 < 100001, !visited[v.0 * 2] {
            visited[v.0 * 2] = true
            queue.append((v.0 * 2, v.1))
        }

        if v.0 - 1 >= 0, !visited[v.0 - 1] {
            visited[v.0 - 1] = true
            queue.append((v.0 - 1, v.1 + 1))
        }
        
        if v.0 + 1 < 100001, !visited[v.0 + 1] {
            visited[v.0 + 1] = true
            queue.append((v.0 + 1, v.1 + 1))
        }

        
    }
}
bfs()
