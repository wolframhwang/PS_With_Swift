var sum = 0
var arr: [Int] = []
var visit: [Bool] = []
var noPrint = false

func printOf() {
    for i in 0..<9 {
        if !visit[i] {
            print(arr[i])
        }
    }
}

func recur(_ cnt: Int, _ now: Int, _ sums: Int) {
    if cnt > 2 { return }
    if cnt == 2 {
        if sums == 100, !noPrint {
            printOf()
            noPrint = true
        }
        return
    }
    if sums < 100 { return }
    if now >= 9 {
        return
    }
    visit[now] = true
    recur(cnt + 1, now + 1, sums - arr[now])
    visit[now] = false
    recur(cnt, now + 1, sums)
}

func main() {
    for _ in 0..<9 {
        let element = Int(readLine()!)!
        sum += element
        arr.append(element)
        visit.append(false)
    }

    arr = arr.sorted { $0 < $1 }

    recur(0, 0, sum)
}

main()
