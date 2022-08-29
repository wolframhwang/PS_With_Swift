let max = Int(readLine()!)!
let maxLength = 1 + (4 * (max - 1))
var myResult = Array(repeating: Array(repeating: String(" "), count: maxLength), count: maxLength)


func recur(row: Int, col: Int,corner: Int) {
	let length = 1 + (4 * (corner - 1))
	
	if corner == 1 {
		myResult[maxLength / 2][maxLength / 2] = "*"
		return
	}
	for c in col..<length + col {
		myResult[row][c] = "*"
		myResult[length + col - 1][c] = "*"
		myResult[c][row] = "*"
		myResult[c][length + col - 1] = "*"
	}
	recur(row: row + 2, col: col + 2, corner: corner - 1)
}

recur(row: 0, col: 0, corner: max)
myResult.forEach { values in
	values.forEach {
		print($0,terminator: "")
	}
	print()
}
