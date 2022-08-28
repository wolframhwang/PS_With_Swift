
let NRC = readLine()!.split(separator: " ").map { Int($0)! }
var N = NRC[0], R = NRC[1], C = NRC[2]
var answer = 0
while N > 0 {
    let s = (1 << (N - 1))
    var q = 0
    if R < s, C < s {
        q = 0
    }
    else if R < s, C >= s {
        q = 1
    }
    else if R >= s, C < s {
        q = 2
    }
    else if R >= s, C >= s {
        q = 3
    }
    R %= s
    C %= s
    answer += (s * s) * q
    N -= 1
}

print(answer)

