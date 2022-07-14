func solutions(_ N: Int) -> Int {
    var ret = 0
    var i = 1
    while i <= N {
        ret += N - i + 1
        i *= 10
    }    
    
    return ret
}

func main() {
    let N = Int(readLine()!)!
    

    print(solutions(N))
}
main()
