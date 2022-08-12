let RCT = readLine()!.split(separator: " ").map { Int($0)! }
let R = RCT[0], C = RCT[1], T = RCT[2]
let dx = [0,0,1,-1], dy = [1,-1,0,0]
var map: [[Int]] = [[Int]](repeating: [], count: R)
var temp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: C), count: R)
var circulator: [(x: Int, y: Int)] = []
for i in 0..<R {
    map[i] = readLine()!.split(separator: " ").map { Int($0)! }
    for j in 0..<map[i].count {
        if map[i][j] == -1 {
            circulator.append((i, j))
        }
    }
}

func simul() {
    for i in 0..<R {
        for j in 0..<C {
            if map[i][j] >= 5 {
                bfs(i, j)
            } else {
                continue
            }
        }
    }

    for i in 0..<R {
        for j in 0..<C {
            map[i][j] += temp[i][j]
            temp[i][j] = 0
        }
    }

    rotate()
}


func bfs(_ x: Int, _ y: Int) {
	let val = map[x][y]
	var rot = 0
	for i in 0..<4 {
		let nx = x + dx[i], ny = y + dy[i]
		if nx < 0 || nx >= R || ny < 0 || ny >= C { continue }
		if (map[nx][ny] == -1) { continue }
		temp[nx][ny] += val / 5
		rot += 1
	}
	map[x][y] -= rot * (val / 5)

}

func rotate() {
	var x = circulator[0].x, y = circulator[0].y;
	for i in (1..<circulator[0].x).reversed() {
		map[i][y] = map[i - 1][y]
	}
	for i in 0..<C-1 {
		map[0][i] = map[0][i + 1]
	}
	for i in 0..<x {
		map[i][C - 1] = map[i + 1][C - 1]
	}
	for i in (2..<C).reversed() {
		map[x][i] = map[x][i - 1]
	}
	map[x][y + 1] = 0
	x = circulator[1].x; y = circulator[1].y
	for i in x+1..<R-1 {
		map[i][0] = map[i + 1][0]
	}
	for i in 0..<C-1 {
		map[R-1][i] = map[R - 1][i + 1];
	}
	for i in (x+1..<R).reversed() {
		map[i][C - 1] = map[i - 1][C - 1];
	}
	for i in (2..<C).reversed() {
		map[x][i] = map[x][i - 1];
	}
	map[x][y + 1] = 0;
}

for _ in 0..<T {
    simul()
}

var ans = 0;
for i in 0..<R {
	for j in 0..<C {
		if (map[i][j] > 0) { 
            ans += map[i][j]
        }
	}
}
print(ans)
