import Foundation

let file = FileIO()
let dx = [-2,-1,-2,-1,1,2,2,1]
let dy = [-1,-2,1,2,-2,-1,1,2]
var I = 0
var start: [Int] = [0, 0], end: [Int] = [0, 0]
var visit: [[Int]] = []

func bfs() -> Int {
    var q: [(x: Int, y: Int, value: Int)] = [(start[0], start[1], 0)]
    var front = 0
    visit[start[0]][start[1]] = 0
    while q.count != front {
        let now = q[front]
        front += 1
        
        if now.x == end[0], now.y == end[1] { return visit[now.x][now.y] }
        
        for i in 0..<8 {
            let nx = now.x + dx[i], ny = now.y + dy[i]
            if nx < 0 || nx >= I || ny < 0 || ny >= I { continue }
            if visit[nx][ny] <= now.value + 1 { continue }
            visit[nx][ny] = now.value + 1
            q.append((nx, ny, visit[nx][ny]))
        }
    }
    return 0
}

func main() {
    let T = file.readInt()
    
    for _ in 0..<T {
        I = file.readInt()
        start[0] = file.readInt()
        start[1] = file.readInt()
        
        end[0] = file.readInt()
        end[1] = file.readInt()
        
        visit = [[Int]](repeating: [Int](repeating: 987654321, count: I), count: I)
        print(bfs())
    }
}


main()


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
