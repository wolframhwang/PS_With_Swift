import Foundation

let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

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

let R = file.readInt(), C = file.readInt(), N = file.readInt()
var map: [[Int]] = []

for _ in 0..<R {
    map.append(file.readString().map {
        if $0 == "O" { return 0 }
        else { return -1 }
    })
}

for t in 1..<N {
    if t % 2 == 0 {
        Bomb(t)
    } else {
        installBomb(t)
    }
}

func installBomb(_ time: Int) {
    for i in 0..<R {
        for j in 0..<C {
            if map[i][j] == -1 {
                map[i][j] = time
            }
        }
    }
}

func Bomb(_ t: Int) {
    var q: [(x: Int, y: Int)] = []
    for i in 0..<R {
        for j in 0..<C {
            if t - map[i][j] >= 2 {
                q.append((i, j))
            }
        }
    }

    for point in q {
        map[point.x][point.y] = -1
        for i in 0..<4 {
            let nx = point.x + dx[i], ny = point.y + dy[i]
            if nx < 0 || nx >= R || ny < 0 || ny >= C { continue }
            map[nx][ny] = -1
        }
    }
}


for i in 0..<R {
    var ret: String = ""
    for j in 0..<C {
        ret += (map[i][j] == -1 ? ".": "O")
    }
    print(ret)
}

