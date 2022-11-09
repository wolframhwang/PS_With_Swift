import Foundation

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
let file = FileIO()
let INF = 987654321
let N = file.readInt(), M = file.readInt(), B = file.readInt()

var map: [[Int]] = [], MINHEIGHT = 987654321, MAXHEIGHT = 0 
var answerTime = INF, answerHeight = -1
for i in 0..<N {
    map.append([])
    for j in 0..<M {
        map[i].append(file.readInt())
        MINHEIGHT = min(MINHEIGHT, map[i][j])
        MAXHEIGHT = max(MAXHEIGHT, map[i][j])
    }
}

func levelingLand(_ height: Int) -> Int {
    var inventory = B, time = 0
    for i in 0..<N {
        for j in 0..<M {
            if height == map[i][j] { continue }
            let diff = abs(height - map[i][j])
            if height < map[i][j] {
                time += diff * 2
                inventory += diff
            } else {
                time += diff
                inventory -= diff
            }
        }
    }
    if inventory < 0 { return INF }
    return time
}

for h in MINHEIGHT...MAXHEIGHT {
    let ret = levelingLand(h)
    if ret <= answerTime {
        answerTime = ret
        answerHeight = h
    }
}
print("\(answerTime) \(answerHeight)")
