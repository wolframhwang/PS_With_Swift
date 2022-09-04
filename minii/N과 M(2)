let v = readLine()!.split(separator: " ").map { Int($0)! }
let n = v[0], c = v[1]
var visited = Array(repeating: false, count: n + 1)
var cnt = Array(repeating: 0, count: c + 1)

func recur(_ now: Int, _ idx: Int) {
	// 반환 조건 => idx의 값이 수열의 길이랑 동일한 경우
	if idx == c {
		for i in 0..<c {
			print(cnt[i],terminator: " ")
		}
		print()
		return
	}

	for j in now...n {
		if visited[j] {
			continue
		}
		
		if j != 0 {
			// 각 값에 대한 설정
			visited[j] = true
			cnt[idx] = j

			recur(j, idx + 1)

			// 초기값으로 변환
			cnt[idx] = 0
			visited[j] = false
		}

	}
}

recur(0, 0)
