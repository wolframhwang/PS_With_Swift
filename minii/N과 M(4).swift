let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0], M = input[1]
var result = [Int]()

func recur(depth: Int, now: Int) {
	if depth == M {
		print(result.map { String($0) }.joined(separator: " "))
		return
	}
	
	for i in now...N {
		result.append(i)
		recur(depth: depth + 1, now: i)
		result.removeLast()
	}

}

recur(depth: 0, now: 1)
