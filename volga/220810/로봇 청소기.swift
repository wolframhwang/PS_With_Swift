let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0], M = NM[1]
let RCD = readLine()!.split(separator: " ").map { Int($0)! }
let r = RCD[0], c = RCD[1]; var d = RCD[2]

let dx = [-1,0,1,0]
let dy = [0,1,0,-1]

var map: [[Int]] = []
var answer = 0
for _ in 0..<N { 
    map.append(readLine()!.split(separator: " ").map { Int($0)! })    
}

func solve(_ x: Int, _ y: Int, _ cnt: Int, _ dirCnt: Int) {
    var ccnt = cnt
    if map[x][y] == 0 {
        map[x][y] = -1
        ccnt += 1
    }
    if dirCnt == 4 {
        let nx = x + dx[(d + 2) % 4], ny = y + dy[(d + 2) % 4]
        if nx >= 0, nx < N, ny >= 0, ny < M, map[nx][ny] != 1 {
            solve(nx, ny, ccnt, 0)
        } else {
            answer = ccnt
            return
        }
    } else {
        var nd = d - 1;
		if nd < 0 { nd = 3; }
		let nx = x + dx[nd], ny = y + dy[nd];
		if nx >= 0 && nx < N && ny >= 0 && ny < M && map[nx][ny] == 0 {
			d = nd;
			solve(nx, ny, ccnt, 0);
		}
		else {
			d = nd;
			solve(x, y, ccnt, dirCnt + 1);
		}
    }
}
solve(r, c, 0, 0)
print(answer)
