let n = Int(readLine()!)!
var mask = 0, answer = 0
var dict: [Int: Bool] = [:]
func recur(_ sum: Int) {
    if sum < 0 { return }
    if sum == 0 {
        if !dict[mask, default: false] {
            dict[mask] = true
            answer += 1
        }
        return
    }
    
    for i in 1...3 {
        mask = (mask << 2) + i
        recur(sum - i)
        mask = mask >> 2
    }
}

func main() {
    for _ in 0..<n {
        mask = 0
        answer = 0
        dict = [:]
        recur(Int(readLine()!)!)
        print(answer)
    }
}

main()
