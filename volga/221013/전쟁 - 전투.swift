import Foundation

let fileIO = FileIO()
let dx = [0,0,1,-1], dy = [1,-1,0,0]
var map: [[Character]] = []
var N = 0, M = 0

func fill(_ target: Character, _ x: Int, _ y: Int, _ visit: inout [[Bool]]) -> Int {
    var q: [(x: Int, y: Int)] = [(x, y)], ret = 0
    var front = 0
    visit[x][y] = true

    while q.count != front {
        let now = q[front]
        front += 1

        ret += 1

        for i in 0..<4 {
            let nx = now.x + dx[i], ny = now.y + dy[i]

            if nx < 0 || nx >= N || ny < 0 || ny >= M { continue }
            if visit[nx][ny] { continue }
            if map[nx][ny] != target { continue }
            visit[nx][ny] = true
            q.append((nx, ny))
        }
    }
    return ret
}

func solve() {
    var W = 0, B = 0
    var visit = [[Bool]](repeating: [Bool](repeating: false, count: map[0].count), count: map.count)
    
    for i in 0..<N {
        for j in 0..<M {
            if visit[i][j] == false {
                let ret = fill(map[i][j], i, j, &visit)
                if map[i][j] == "W" {
                    W = W + ret * ret
                } else {
                    B = B + ret * ret
                }
            }
        }
    }

    print("\(W) \(B)")
}

func input() {
    M = fileIO.readInt()
    N = fileIO.readInt()

    for _ in 0..<N {
        let mapline = fileIO.readString()
        map.append([])
        for c in mapline {
            map[map.count - 1].append(c)
        }
    }
}

func main() {
    input()
    solve()
}

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
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
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

main()
