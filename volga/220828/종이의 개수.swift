let N = Int(readLine()!)!
var map: [[Int]] = []
var now = -10
var isFind = false

for i in 0..<N {
    let inp = readLine()!.split(separator: " ").map { Int($0)! }
    map.append(inp)
    for j in 0..<N {
        if i == 0, j == 0 { now = map[i][j] }
        else {
            if now != map[i][j] { isFind = true }
        }
    }
}

var dict: [Int: Int] = [:]

func go(_ xStart: Int, _ xEnd: Int, _ yStart: Int, _ yEnd: Int, _ cnt: Int, _ value: Int) {
    let temp = map[xStart][yStart]
    var isFind = false
    for i in stride(from: xStart, to: xEnd + 1, by: 1) {
        for j in stride(from: yStart, to: yEnd + 1, by: 1) {
            if map[i][j] != temp {
                isFind = true
                break
            }
        }
        if isFind { break }
    }
    if isFind {
        let gan = cnt / 3
        go(xStart, xStart + gan - 1, yStart, yStart + gan - 1, gan, value)
        go(xStart + gan, xStart + 2 * gan - 1, yStart, yStart + gan - 1,gan, value)
        go(xStart + 2 * gan, xStart + 3 * gan - 1, yStart, yStart + gan - 1, gan, value)
        
        go(xStart, xStart + gan - 1, yStart + gan, yStart + 2 * gan - 1, gan, value)
        go(xStart + gan, xStart + 2 * gan - 1, yStart + gan, yStart + 2 * gan - 1,gan, value)
        go(xStart + 2 * gan, xStart + 3 * gan - 1, yStart + gan, yStart + 2 * gan - 1,gan, value)
        
        go(xStart, xStart + gan - 1, yStart + 2 * gan, yStart + 3 * gan - 1, gan, value)
        go(xStart + gan, xStart + 2 * gan - 1, yStart + 2 * gan, yStart + 3 * gan - 1,gan, value )
        go(xStart + 2 * gan, xStart + 3 * gan - 1, yStart +  2 * gan, yStart + 3 * gan - 1, gan, value)
    } else {
        dict[temp, default: 0] += 1
        return
    }
}

if !isFind {
    switch now {
    case 0:
        print("0\n1\n0")
        break
    case 1:
        print("0\n0\n1")
        break
    case -1:
        print("1\n0\n0")
        break
    default:
        break
    }
} else {
    dict[-1] = 0
    dict[0] = 0
    dict[1] = 0
    go(0, N - 1, 0, N - 1, N, 0)
    print("\(dict[-1, default: 0])\n\(dict[0,default: 0])\n\(dict[1,default: 0])")
}
