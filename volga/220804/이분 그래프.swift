let K = Int(readLine()!)!
for _ in 0..<K {
    let VE = readLine()!.split(separator: " ").map{ Int($0)! }
    let V = VE[0], E = VE[1]
    var isVisit: [Int] = [Int](repeating: 0, count: V + 1)
    var map: [[Int]] = [[Int]](repeating: [], count: V + 1)

    for _ in 0..<E {
        let uv = readLine()!.split(separator: " ").map { Int($0)! }
        map[uv[0]].append(uv[1])
        map[uv[1]].append(uv[0])
    }
    var cnt = 0

    for i in 1...V {
        if isVisit[i] == 0 {
            recur(i, 1)
        }
    }

    func recur(_ node: Int, _ team: Int) {
        isVisit[node] = team
        for nextNode in map[node] {
            if isVisit[nextNode] != 0 { continue }
            recur(nextNode, 3 - team)
        }
    }
    var isOK = true
    for i in 1...V {
        for j in map[i] {
            if isVisit[i] == isVisit[j] {
                isOK = false                
            }
        }
    }
    if isOK { print("YES") }
    else { print("NO") }
    
}
