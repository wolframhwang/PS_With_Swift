let N = Int(readLine()!)!
//4: 13
//3: 9
//2: 5
//1: 1
//1 + 4 + 4 + 4 + 4
var dict = [[Character]](repeating: [Character](repeating: " ", count: N * 4 + 10), count: N * 4 + 10)
var maxLen = 0
func recur(_ len: Int, _ x: Int, _ y: Int) {
	if (len == 0) { return }
	recur(len - 1, x + 2, y + 2)
	makeLine(len, x, y);
}

func makeLine(_ len: Int, _ x: Int, _ y: Int) {
	let realLen = 1 + 4 * (len - 1)
	maxLen = maxLen < realLen ? realLen : maxLen
	for i in 0..<realLen {
		if i == 0 || i == realLen - 1 {
			for j in 0..<realLen {
				dict[i + x][j + y] = "*"
			}
		}
		else {
			dict[i + x][y] = "*"
			dict[i + x][y + realLen - 1] = "*"
		}
	}
}

recur(N, 0, 0)

for i in 0..<maxLen {
    var str = ""
    for j in 0..<maxLen {
        str += String(dict[i][j])
    }
    print(str)
}

