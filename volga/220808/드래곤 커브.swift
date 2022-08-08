let N = Int(readLine()!)!
let dx = [0,-1,0,1]
let dy = [1,0,-1,0]
struct dragon {
    var x: Int
    var y: Int
    var d: Int
    var g: Int
}
var gen: [dragon] = []
for _ in 0..<N {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    gen.append(dragon(x: line[1], y: line[0], d: line[2], g: line[3]))
}
var map: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: 101), count: 101)
var dirSet: [[Int]] = [[Int]](repeating: [], count: N + 1)
func makeDragonCurve(_ idx: Int, _ g: Int) {
    if g > gen[idx].g {
        return
    }
    if dirSet[idx].count == 0 {
        dirSet[idx].append(gen[idx].d)
        var x = gen[idx].x + dx[gen[idx].d], y = gen[idx].y + dy[gen[idx].d]
        if x < 0 || x > 100 || y < 0 || y > 100 { return }
        map[x][y] = true
        gen[idx].x = x; gen[idx].y = y
        makeDragonCurve(idx, g + 1)
    } else {
        var x = gen[idx].x, y = gen[idx].y
        let size = dirSet[idx].count
        for i in (0..<size).reversed() {
            let dir = (dirSet[idx][i] + 1) % 4
            let nx = x + dx[dir], ny = y + dy[dir]
            if nx < 0 || nx > 100 || ny < 0 || ny > 100 { continue }
            map[nx][ny] = true
            dirSet[idx].append(dir)
            x = nx; y = ny
        }
        gen[idx].x = x; gen[idx].y = y
        makeDragonCurve(idx, g + 1)
    }
}

func solve() -> Int {
	var ret = 0;
	for i in 0..<100 {
		for j in 0..<100 {
			if !map[i][j] { continue }
			if !map[i + 1][j + 1] { continue }
			if !map[i + 1][j] { continue }
			if !map[i][j + 1] { continue }
			ret += 1;
		}
	}
	return ret;
}

for i in 0..<N {
    map[gen[i].x][gen[i].y] = true
    makeDragonCurve(i, 0)
}

print(solve())
