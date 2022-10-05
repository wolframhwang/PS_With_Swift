var cnt = Int(readLine()!)!
var graph: [Int] = []
var result: [Int] = []

func maxHeap() {
    var maxIdx: Int = 0
    var maxValue: Int = 0

    if graph.isEmpty {
        result.append(0)
        return
    }

    for idx in 0..<graph.count {
        let idxValue = graph[idx]

        if idxValue > maxValue {
            maxValue = idxValue
            maxIdx = idx
        }
    }
    graph[maxIdx] = -1
    result.append(maxValue)
}

for _ in 0..<cnt {
    let number = Int(readLine()!)!

    if number == 0 {
        maxHeap()
    } else {
        graph.append(number)
    }
}

result.forEach {
    print($0)
}
