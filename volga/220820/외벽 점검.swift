import Foundation

func isClear(_ n: Int, _ dist: inout [Int], _ weak: inout [Int], _ position: Int, _ now: Int, _ limit: Int) -> Bool {
    if now >= limit {
        return true
    }
    var position = position, add = 0, ext = 0
    for i in 0..<n {
        if position & (1 << i) != 0 { continue }
        position += (1 << i)
        add = 1
        ext = dist[i]
        
        while now + add < limit  {
            ext -= weak[now + add + 1] - weak[now + add]
            if ext < 0 { break }
            add += 1
        }
        if isClear(n, &dist, &weak, position, now + add, limit) {
            return true
        }
        position -= (1 << i)
    }
    return false
}

func solution(_ n:Int, _ weak:[Int], _ dist:[Int]) -> Int {
    var answer = -1
    var weak = weak, dist = dist.sorted { $0 > $1 }
    let len = weak.count
    for i in 0..<len {
        weak.append(n + weak[i])
    }
    
    for i in 1...dist.count {
        for j in 0..<len {
            if isClear(i, &dist, &weak, 0, j , j + len) {
                answer = i
                return answer
            }
        }
    }
    
    return answer
}
