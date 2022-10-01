import Foundation
struct heap {
    var lastn = 0
    var heap : [Int] = []
    init(_ size: Int) {
        lastn = 0
        heap = [Int](repeating: 0, count: size)
    }
    
    mutating func push(_ input: Int, comp: (_ s1: Int,_ s2: Int) -> Bool) {
        self.lastn += 1
        heap[self.lastn] = input
        var C = lastn
        var P = C / 2
        while P > 0 && !comp(heap[P], heap[C]) {
            let temp = heap[P]
            heap[P] = heap[C]
            heap[C] = temp
            C = P
            P = C / 2
        }
    }
    
    mutating func pop(comp: (_ s1: Int,_ s2: Int) -> Bool) {
        heap[1] = heap[self.lastn]
        self.lastn -= 1
        var P = 1
        var L = 2
        var R = 3
        var C = 0
        while L <= self.lastn {
            if R > lastn {
                C = L
            }else {
                C = comp(heap[L], heap[R]) ? L: R
            }
            if comp(heap[P], heap[C]){
                break
            }
            let temp = heap[P]
            heap[P] = heap[C]
            heap[C] = temp
            P = C; L = P * 2; R = L + 1
        }
    }
}
let compmax = { (_ s1: Int, _ s2: Int) -> Bool in
    return s1 >= s2
}

let compmin = {(_ s1: Int, _ s2: Int)->Bool in
    return s1 <= s2
}

let N = Int(readLine()!)!
var hq: heap = heap(100001)

for _ in 0..<N {
    let x = Int(readLine()!)!
    if x == 0 {
        if hq.lastn == 0 {
            print(0)
        } else {
            print(hq.heap[1])
            hq.pop(comp: compmin)
        }
    } else {
        hq.push(x, comp: compmin)
    }
}
