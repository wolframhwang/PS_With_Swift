import Foundation
//let nwl = readLine()!.split(separator: " ").map { Int($0)! }
//let n = nwl[0], w = nwl[1], l = nwl[2]
//let trucks = readLine()!.split(separator: " ").map { Int($0)! }
let file = FileIO()

let n = file.readInt(), w = file.readInt(), l = file.readInt()

var trucks: [Int] = []

for _ in 0..<n {
    trucks.append(file.readInt())
}
var idx = 0
var queue: [(endTime: Int, weight: Int)] = []
var front = 0

var time = 0, totalWeight = 0

while true {
    if queue.count > front, queue[front].endTime == time {
        totalWeight -= queue[front].weight
        front += 1
    }
    let size = queue.count - front
    if trucks.count > idx, totalWeight + trucks[idx] <= l, size < w {
        queue.append((time + w, trucks[idx]))
        totalWeight += trucks[idx]
        idx += 1
    }
    time += 1
    if queue.count == front {
        print(time)
        break
    }
}


final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return Array(buffer[beginIndex..<(index-1)])
    }
}
