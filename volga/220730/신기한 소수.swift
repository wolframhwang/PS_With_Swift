let n = Int(readLine()!)!
var prime = [2,3,5,7]

func primeChecker(_ number: Int) -> Bool {
    var i = 2
    while i * i <= number {
        if number % i == 0 { return false }
        i += 1
    }
    return true
}

func recur(_ m: Int, _ cnt: Int) {
    var cnt = cnt
    if m == n {
        print(cnt)
        return
    } else {
        if m == 0 {
            for i in 0..<4 {
                recur(1, prime[i])
            }
        } else {
            cnt *= 10
            for i in 1...9 {
                var c = cnt
                c += i
                if primeChecker(c) {
                    recur(m + 1, c)
                }
            }
        }
    }
}

recur(0, 0)
