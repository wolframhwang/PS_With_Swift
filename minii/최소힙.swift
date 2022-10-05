let mCount = Int(readLine()!)!
var graph: [Int] = []
var result = [Int]()

func minHeap() {
    var minI: Int = 0
    var minV: Int = Int.max

    if graph.isEmpty {
        result.append(0)
        return
    }

    for i in 0..<graph.count {
        let cVal = graph[i]

        if cVal < minV {
            minV = cVal
            minI = i
        }
    }
    
    if minV == Int.max {
        result.append(0)
    } else {
        graph[minI] = Int.max
        result.append(minV)
    }
}

for _ in 0..<mCount {
    let number = Int(readLine()!)!

    if number == 0 {
        minHeap()
    } else {
        graph.append(number)
    }
}

result.forEach {
    print($0)
}
