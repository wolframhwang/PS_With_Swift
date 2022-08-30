let count = Int(readLine()!)!
var graph = Array(repeating: [Int](), count: count)
var values: [Int] = [0, 0]

(0...count-1).forEach { index in
	graph[index] = readLine()!.split(separator: " ").map { Int($0)! }
}

func check(x: Int, y: Int, xx: Int, yy: Int) -> Bool {
	let first = graph[x][y]
	if xx > x && yy > y {
		for row in x..<xx {
			for col in y..<yy {
				if graph[row][col] != first {
					return false
				}
			}
		}
	}

	values[first] += 1
	return true
}

func recur(_ x: Int, _ y: Int, _ xx: Int, _ yy: Int) {
	if check(x: x, y: y, xx: xx, yy: yy) {
		return
	}
	
	let halfX = (xx - x) / 2 // 4
	let halfY = (yy - y) / 2 // 4
	
	recur(x, y, x + halfX, y + halfY) // (0,0) -> (4,4)
	recur(x, y + halfY, x + halfX, y + (2 * halfY)) // (0,0) -> (2,4)
	recur(x + halfX, y, x + (2 * halfX), y + halfY) // (0,2) -> (2,4)
	recur(x + halfX, y + halfY, x + (2 * halfX), y + (2 * halfY)) // (2,0) -> (4,2)
}

recur(0, 0, count, count)
print(values[0])
print(values[1])
