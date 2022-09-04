let N = Int(readLine()!)!
let ret = solutions(N)
print(ret)

func solutions(_ N: Int) -> Int {
    var ret = 0
    var i = 1
    while i <= N {
        ret += N - i + 1
        i *= 10
    }    
    
    return ret
}
