
let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = NM[0], m = NM[1]
var graph = Array.init(repeating: [Int](), count: n + 1)
var visited = Array.init(repeating: false, count: n + 1)
var count: Int = 0

for _ in 1...m {
    let uv = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    graph[uv[0]].append(uv[1])
    graph[uv[1]].append(uv[0])
    
}

func findLine(index: Int) {
    visited[index] = true
    var map = graph[index]
    
    while !map.isEmpty {
        let first = map.removeFirst()
        
        for value in graph[first] {
            if map.contains(value) || visited[value] { continue }
            map.append(value)
        }
        
        visited[first] = true
    }
    
    count += 1
}

for index in 1...n {
    if visited[index] { continue }
    findLine(index: index)
}

print(count)
