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
let dx = [0,0,1,-1], dy = [1,-1,0,0]
let file = FileIO()
let M = file.readInt()
let N = file.readInt()
var map: [[Int]] = []
var q: [(x: Int, y: Int)] = [], front = 0
var visit: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: N), count: M)

for _ in 0..<M {
    map.append(file.readString().map { Int(String($0))! })
}

for j in 0..<N {
    if map[0][j] == 0 {
        visit[0][j] = true
        q.append((0, j))
    }
}

func bfs() -> String {
    while front != q.count {
        let now = q[front]
        front += 1

        if now.x == (M - 1) { return "YES" }

        for i in 0..<4 {
            let nx = now.x + dx[i], ny = now.y + dy[i]
            if nx < 0 || nx >= M || ny < 0 || ny >= N { continue }
            if visit[nx][ny] { continue }
            if map[nx][ny] == 1 { continue }
            visit[nx][ny] = true
            q.append((nx, ny))
        }
    }
    return "NO"
}
print(bfs())
