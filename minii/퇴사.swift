let N = Int(readLine()!)!
var graph: [(Int, Int)] = []
var money: Int = 0
var result = [Int]()

for _ in 1...N {
	let input = readLine()!.split(separator: " ").map { Int($0)! }
	graph.append((input[0], input[1]))
}

func recur(index: Int) {
	if index >= N {
		result.append(money)
		money = 0
		return
	}
	
	let m = graph[index].1
	let j = (graph[index].0 == 1) ? 1 : graph[index].0 - 1
	
	money += m
	recur(index: index + j)
}

for i in 0..<N {
	recur(index: i)
}

print(result.max()!)
