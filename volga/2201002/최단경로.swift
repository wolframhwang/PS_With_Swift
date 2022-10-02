let INF = 987654321
let VE = readLine()!.split(separator: " ").map { Int($0)! }
let V = VE[0], E = VE[1]
let startNode = Int(readLine()!)! - 1
var map = [[(to: Int, value: Int)]](repeating: [], count: V)
var distance = [Int](repeating: INF, count: V)

for _ in 0..<E {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    map[edge[0] - 1].append((edge[1] - 1, edge[2]))
}

var heap = [(to: Int, value: Int)](repeating: (0, 0), count: V * 10)
var lastn = 0

func top(_ heap: inout [(to: Int, value: Int)]) -> (to: Int, value: Int) {
    return heap[1]
}

func push(_ heap: inout [(to: Int, value: Int)],
          _ lastn: inout Int,
          _ input: (to: Int, value: Int),
          comp: (_ s1: (to: Int, value: Int),_ s2: (to: Int, value: Int)) -> Bool) {
    lastn += 1
    heap[lastn] = input
    var C = lastn
    var P = C / 2
    while P > 0 && !comp(heap[P], heap[C]) {
        let temp = heap[P]; heap[P] = heap[C]; heap[C] = temp
        C = P
        P = C / 2
    }
}

func pop(_ heap: inout [(to: Int, value: Int)],
         _ lastn: inout Int,
         comp: (_ s1: (to: Int, value: Int), _ s2: (to: Int, value: Int)) -> Bool) {
    heap[1] = heap[lastn]
    lastn -= 1
    var P = 1
    var L = 2
    var R = 3
    var C = 0
    while L <= lastn {
        if R > lastn {
            C = L
        }else {
            C = comp(heap[L], heap[R]) ? L: R
        }
        if comp(heap[P], heap[C]){
            break
        }
        let temp = heap[P]; heap[P] = heap[C]; heap[C] = temp
        P = C; L = P * 2; R = L + 1
    }
}

let compmax = { (_ s1: Int, _ s2: Int) -> Bool in
    return s1 > s2
}

let compmin = {(_ s1: (to: Int, value: Int), _ s2: (to: Int, value: Int))->Bool in
    return s1.value < s2.value
}

func dijkstra(_ startNode: Int) {
    distance[startNode] = 0
    push(&heap, &lastn, (startNode, 0), comp: compmin)
    while lastn > 0 {
        let now = top(&heap)
        pop(&heap, &lastn, comp: compmin)
        
        for next in map[now.to] {
            if distance[next.to] > distance[now.to] + next.value {
                distance[next.to] = distance[now.to] + next.value
                push(&heap, &lastn, (next.to, distance[next.to]), comp: compmin)
            }
        }
    }
}

dijkstra(startNode)

distance.forEach { value in
    if value == INF { print("INF") }
    else { print(value) }
}
