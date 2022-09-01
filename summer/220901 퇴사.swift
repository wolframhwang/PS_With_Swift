let size = Int(readLine()!)!
var map = [(t: Int, p: Int)]()

for _ in 0..<size {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let t = input[0]
    let p = input[1]
    map.append((t, p))
}

var max = 0

func recur(_ idx: Int, _ curSum : Int) {
    if idx >= map.count {
        if curSum > max {
            max = curSum
        }
        return
    }

    if map[idx].t == 1 {
        recur(idx + 1, curSum + map[idx].p)
    } else {
        recur(idx + 1, curSum)
        if idx + map[idx].t > map.count {
            if curSum > max {
                max = curSum
            }
            
            return
        } else {
            recur(idx + map[idx].t, curSum + map[idx].p)
        }
    }
}

recur(0, 0)
print(max)
