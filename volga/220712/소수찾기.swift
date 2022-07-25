let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var answer = 0

for n in arr {
    let isPrime = IntToIsPrime(n)
    if isPrime { answer += 1 }
}

func IntToIsPrime(_ n: Int) -> Bool {
    if n == 1 { return false }
    var i = 2
    while i * i <= n {
        if n % i == 0 { return false }
        i += 1
    }
    return true
}
print(answer)
