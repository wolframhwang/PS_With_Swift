let count = Int(readLine()!)!

func checkBigger(map: [(number: Int, rank: Int)], nowRank: Int) -> Bool {
    for element in map {
        if nowRank < element.rank {
            return true
        }
    }

    return false
}

func bfs(map: [(number: Int, rank: Int)], documentNumber: Int) -> Int {

    var map = map
    var visit: [Int] = []

    while !map.isEmpty {
        let now = map.removeFirst()

        if checkBigger(map: map, nowRank: now.rank) {
            map.append(now)
        } else {
            visit.append(now.number)
            if now.number == documentNumber { break }
        }
    }

    return visit.count
}

for _ in 0..<count {
    let NM = readLine()!.split(separator: " ").map { Int($0)! }
    let _ = NM[0], dn = NM[1]

    let rankings = readLine()!.split(separator: " ").map { Int($0)! }.enumerated().map { ($0.offset, $0.element)}

    print(bfs(map: rankings, documentNumber: dn))
}
