let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0], M = input[1]
var graph = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var result = [Int]()

func recur(now: Int, depth: Int) {

	if depth == M {
		print(result.map { String($0) }.joined(separator: " "))
		return
	}

	for idx in 0..<N {
		if !result.contains(graph[idx]) {
			result.append(graph[idx])
			recur(now: idx, depth: depth + 1)
			result.removeLast()
		}
	}
}

recur(now: 0, depth: 0)
