import Foundation

let cases = Int(readLine()!)!
var answer = [String]()

for _ in 0..<cases {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let vertice = input[0]
    let edges = input[1]
    
//    var graph = Array(repeating: Array(repeating: 0, count: vertice), count: vertice)
    var visited = [Int](repeating: 0, count: vertice + 1)
    var graph: Dictionary<Int, [Int]> = [:]
    
    for _ in 0..<edges {
        let edge = readLine()!.split(separator: " ").map { Int($0)! }
        let from = edge[0]
        let to = edge[1]
        
        graph[from, default: []].append(to)
        graph[to, default: []].append(from)
        
//        graph[from][to] = 1
//        graph[to][from] = 1
    }
    
    var isValid = true
    for i in 1...vertice {
        if visited[i] != 0 { continue }
        let result = bfs(i)
        
        if result == false {
            isValid = false
            break
        }
    }
    
    if isValid { answer.append("YES") }
    else { answer.append("NO") }
    
    func bfs(_ start: Int) -> Bool {
        var queue: Array<Int> = [start]
        visited[start] = 1
        
        while !queue.isEmpty {
            let cur = queue[0]
            
            guard let elements = graph[cur] else {
                return true
            }
            
            for i in elements {
                if visited[i] == 0 {
                    queue.append(i)
                    visited[i] = visited[cur] * -1
                } else {
                    if visited[i] == visited[cur] { return false }
                }
            }
            
//            for i in 0..<vertice {
//                if graph[cur][i] == 0 { continue }
//
//                if graph[cur][i] == 1 && visited[i] == 0 {
//                    queue.append(i)
//                    visited[i] = visited[cur] * (-1)
//                } else if graph[cur][i] == 1 && visited[i] == visited[cur] {
//                    return false
//                }
//            }
            
            queue.removeFirst()
        }
        
        return true
    }
}

answer.forEach { print($0) }
