let t = Int(readLine()!)!

for _ in 0..<t {
    let parameters = readLine()!.split(separator: " ").map { Int($0)! }
    print(solution(parameters[0], parameters[1], parameters[2], parameters[3]))
}

func solution(_ N: Int, _ M: Int, _ x: Int, _ y :Int) -> Int {
	var xx = x - 1
	var yy = y - 1
	var ret = -1, sum = xx
	var yp = xx % M
	for i in 0..<(N + M) {
		if (yp == yy) {
			ret = sum + 1;
			break;
		}
		yp = (yp + N) % M;
		sum += N;
	}

	return ret;
}
