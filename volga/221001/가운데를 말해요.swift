import Foundation

var min: [Int] = [0]
var minLastn = 0
var max: [Int] = [0]
var maxLastn = 0

func top(_ heap: inout [Int]) -> Int {
    return heap[1]
}

func pushMin(_ input: Int) {
    minLastn += 1
    min.append(input)
    var C: Int = minLastn
    var P: Int = C / 2
    while P > 0 && !compmin(min[P], min[C]) {
        let temp = min[P]; min[P] = min[C]; min[C] = temp
        C = P
        P = C / 2
    }
}

func pushMax(_ input: Int) {
    maxLastn += 1
    max.append(input)
    var C: Int = maxLastn
    var P: Int = C / 2
    while P > 0 && !compmax(max[P], max[C]) {
        let temp = max[P]; max[P] = max[C]; max[C] = temp
        C = P
        P = C / 2
    }
}

func popMin() -> Int {
    let ret = min[1]
    min[1] = min[minLastn]
    min.popLast()
    minLastn -= 1
    var P = 1
    var L = 2
    var R = 3
    var C = 0
    while L <= minLastn {
        if R > minLastn {
            C = L
        }else {
            C = compmin(min[L], min[R]) ? L: R
        }
        if compmin(min[P], min[C]){
            break
        }
        let temp = min[P]; min[P] = min[C]; min[C] = temp
        P = C; L = P * 2; R = L + 1
    }
    return ret
}

func popMax() -> Int {
    let ret = max[1]
    max[1] = max[maxLastn]
    max.popLast()
    maxLastn -= 1
    var P = 1
    var L = 2
    var R = 3
    var C = 0
    while L <= maxLastn {
        if R > maxLastn {
            C = L
        }else {
            C = compmax(max[L], max[R]) ? L: R
        }
        if compmax(max[P], max[C]){
            break
        }
        let temp = max[P]; max[P] = max[C]; max[C] = temp
        P = C; L = P * 2; R = L + 1
    }
    return ret
}

func compmax(_ s1: Int, _ s2: Int) -> Bool {
    return s1 >= s2
}

func compmin(_ s1: Int, _ s2: Int) -> Bool {
    return s1 <= s2
}

let INF = 987654321

var answer: String = ""

let file = FileIO()
let N = file.readInt()

for _ in 0..<N {
    //Min 가운데 Max
    let input = file.readInt()
    if maxLastn == 0 {
        pushMax(input)
    } else {
        if input > max[1] {
            pushMin(input)
        } else {
            pushMax(input)
        }
        
        if maxLastn == minLastn + 2 {
            pushMin(popMax())
        } else if maxLastn + 1 == minLastn {
            pushMax(popMin())
        }
    }
    answer += "\(max[1])\n"
}

print(answer)

final class FileIO {
    private var buffer:[UInt8]
    private var index: Int

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer.withUnsafeBufferPointer { $0[index] }
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10 || now == 32 { // 공백과 줄바꿈 무시
            now = read()
        }
        
        if now == 45{ // 음수 처리
            isPositive.toggle()
            now = read()
        }
        
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()

        while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시

        while now != 10
            && now != 32 && now != 0 {
                str += String(bytes: [now], encoding: .ascii)!
                now = read()
        }

        return str
    }
}
