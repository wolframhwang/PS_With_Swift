let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0], M = input[1], V = input[2]
var graph = Array(repeating: [Int](), count: N + 1)

for _ in 1...M {
    let g = readLine()!.split(separator: " ").map { Int($0)! }
    graph[g[1]].append(g[0])
    graph[g[0]].append(g[1])
    
    graph[g[1]].sort()
    graph[g[0]].sort()
}

func DFS(_ start: Int) -> String {
    var visit: [Int] = []
    var need = [start]
    
    while !need.isEmpty {
        let node = need.removeLast()
        if visit.contains(node) { continue }
        
        if node != 0 {
            visit.append(node)
        }
        
        need += graph[node]
    }
    
    return visit.map { String($0) }.joined(separator: " ")
}

func BFS(_ start: Int) -> String {
    var visit: [Int] = []
    var need = [start]
    
    while !need.isEmpty {
        let node = need.removeFirst()
        
        if visit.contains(node) { continue }
        
        if node != 0 {
            visit.append(node)
        }
        need += graph[node]
    }
    return visit.map { String($0) }.joined(separator: " ")
}
print(DFS(V))
print(BFS(V))
