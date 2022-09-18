let count = Int(readLine()!)!
var map = Array(repeating: [Int](), count: count)
var visited = Array(repeating: false, count: count)
var sum = Int.max

for idx in 0..<count {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    map[idx] = input
}


func recur(_ depth: Int, _ row: Int, _ cost: Int, _ start: Int) {

    var total = cost

    if depth == count - 1 && row == start {
        let cost = map[row][start]
        total += cost
        print("total \(total) sum \(sum)")
        sum = min(sum, total)
        return
    }

    for col in 0..<count {
        if !visited[col] && map[row][col] > 0 {
            total += map[row][col]
            visited[col] = true

            if total <= sum {
                recur(depth + 1, col, total, start)
            }

            visited[col] = false
            total -= map[row][col]
        }


    }
}

visited = Array(repeating: false, count: count)
recur(0, 0, 0, 0)

print(sum)
