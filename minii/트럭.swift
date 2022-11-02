let NWL = readLine()!.split(separator: " ").map { Int($0)! }
let N = NWL[0], W = NWL[1], L = NWL[2]
var map = readLine()!.split(separator: " ").map { Int($0)! }

func bfs() -> Int {
    var map = map
    var visit = [Int].init(repeating: 0, count: W)
    var sec: Int = 0
    var currentWeight = 0
    
    while !visit.isEmpty {
        sec += 1
        currentWeight -= visit.removeFirst()

        if let truck = map.first {
            if currentWeight + truck > L {
                visit.append(0)
            } else {
                let now = map.removeFirst()
                visit.append(now)
                currentWeight += now
            }
        }
    }

    return sec
}

print(bfs())
