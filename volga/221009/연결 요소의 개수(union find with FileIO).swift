import Foundation
let file = FileIO()
let N = file.readInt(), M = file.readInt()

var map = [[Int]](repeating: [], count: N + 1)
var parent = [Int]()

for i in 0...N {
    parent.append(i)
}

for _ in 0..<M {
    let u = file.readInt(), v = file.readInt()
    if parent[u] != parent[v] {
        let max = parent[u] < parent[v] ? parent[v]: parent[u]
        let min = parent[u] > parent[v] ? parent[v]: parent[u]
        
        for j in 1...N {
            if parent[j] == max { parent[j] = min }
        }
    }
    
}

var answer = 0
for i in 1...N {
    if parent[i] == i {
        answer += 1
    }
}

print(answer)


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
